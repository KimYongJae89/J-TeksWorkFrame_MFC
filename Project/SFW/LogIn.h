#pragma once


// CLogIn 대화 상자입니다.

class CLogIn : public CDialogEx
{
	DECLARE_DYNAMIC(CLogIn)

public:
	CLogIn(CWnd* pParent = NULL);   // 표준 생성자입니다.
	virtual ~CLogIn();

// 대화 상자 데이터입니다.
	enum { IDD = IDD_LOGIN };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 지원입니다.

	DECLARE_MESSAGE_MAP()
};
