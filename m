Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 863AB1514AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2020 04:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgBDDfs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Feb 2020 22:35:48 -0500
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:51296
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726694AbgBDDfs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Feb 2020 22:35:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SskPPtxVgw4ZK48gfQQEdhWtlDPJJ5xxo7ijd/mo7qjwvZszaALusiYU0NZF+y/tJeFEUJ/4iu4rE2Fv5OXT0kmlfuDG7Nw0ZK4Onc9eZWO4HHugCQzhUPffER0e5BO9X3BTu4rH2X3eRQ4PoeM8MtbN21zEpyVG0hOJS7jTi4xYlwdjgzrVPhS6J2EfdSm4bm2BfXxtyx+updzbzZMnLZYY5ououN+bSR5Yt69e/nNhzRQmlEBvs8VxJpEf+G/KnpXl/QEd6pHSAX81Q18bVFk2HP0W6A99JVj2B1jfnsfaqyce/SpmrT5BsTS9gNXQKb08cxU8Sa/QRhu8WvKQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYFcUMEvjckWUCQlFs86ZdNyFWIiKsDKvnWgAWM+2PA=;
 b=ASOsDVLAwBY/8+kyijXDBtSPrnM46GQR5K1QdjhqqPLPPlpommSWWuQ8w0j/ExkTRrWm68z059SXeKjBJvzY1Kkute/GxntjVBRp3Rt41eaPh7CLUAWx6FGFzt6JcwOaPvhkNKWlX6ndw3w3u1smQtOOApKnHAMwo0ypCeP+424VCXea2RV2zvQpEQHQGaKM2GbmrnftTRD5GaMSapK20OCyDvC42mcAoj3eBCB01DQTfARe2lBuh+7808GvEwcP+LgvDv25XFJDyfdjxDYP2f8KstHxQYKfCHsAOlxSqdEtpCP4bxsLMm9aa1rEbZ8M2U/aZe9yBudc3GuouTXPsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYFcUMEvjckWUCQlFs86ZdNyFWIiKsDKvnWgAWM+2PA=;
 b=q98wW0awbpbc7zNIveIeRFKrbq1UnSWw75uMX51Xdo3faNeD+ku8aNB8g8JezTheT7h+OD0u/10H9CU1Mbna+eR9FBLt+hVmDjeto8T3+f9brkZTLN2hznBZBobe9zVstfJ3QBFltsnkleU7qtLsBycLkxkRm0b8BW0I1Aaf9pY=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1755.jpnprd01.prod.outlook.com (52.133.161.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Tue, 4 Feb 2020 03:35:44 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea%7]) with mapi id 15.20.2686.030; Tue, 4 Feb 2020
 03:35:44 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFT 0/5] sh_eth: get rid of the dedicated regiseter
 mapping for RZ/A1 (R7S72100)
Thread-Topic: [PATCH RFT 0/5] sh_eth: get rid of the dedicated regiseter
 mapping for RZ/A1 (R7S72100)
Thread-Index: AQHV2sjuY/y4+IGNNU209XmT/+6jSqgKYm5A
Date:   Tue, 4 Feb 2020 03:35:44 +0000
Message-ID: <TY1PR01MB156273A40DA6599896C8B34F8A030@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
In-Reply-To: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNmE2N2U5NmQtNDZmZi0xMWVhLWFhNWItOTRlNmY3Njc5M2FlXGFtZS10ZXN0XDZhNjdlOTZmLTQ2ZmYtMTFlYS1hYTViLTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iMzM2IiB0PSIxMzIyNTI2MDk0MTQ3MzkxODUiIGg9IkhMSEVwVytaSm53MGVKYlpoWTVGSzRtKzNRQT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5ddbe3b0-5166-43c6-6816-08d7a92350f0
x-ms-traffictypediagnostic: TY1PR01MB1755:
x-microsoft-antispam-prvs: <TY1PR01MB1755009F1B1EFEBF70E502A88A030@TY1PR01MB1755.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 03030B9493
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(199004)(189003)(478600001)(7696005)(8936002)(8676002)(33656002)(2906002)(81156014)(81166006)(66476007)(186003)(9686003)(71200400001)(5660300002)(26005)(6506007)(52536014)(66556008)(316002)(110136005)(64756008)(558084003)(55016002)(66446008)(86362001)(76116006)(66946007)(26583001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1755;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AU2iiIl58E5WsXTedTFDCBWPr39hpMGi1Fdd1Wc7TkkdAhLi6mPfmHGEZH9S5IEplJEgy6RUqqYY3MMimQhVsxYrvTtJDO/NRtRU4hizdrd99VfH0wnljui8Qo//zyUe1mb3MPHj6JyA/jSPUJUiOTsz6WFro+CUGXxaFzmtmNJ5aH2lThlbYnaSD9YYwXFYvOC4941w8hQSrXo8XxDfRH3EVzUmlgEeEHJh4P/WdNMq6Bp3NPsMnGs5989zYisSrQul18gO5eIu3vhEtLiEWTGyBGvFqQiOgayznnV7a0ZopXVAjLqKTnhiDH9aczjzYVbXQBzPb6g6OvIrIjq7VtNoKeoZBQCPsEf5j457CIZxnjDVt4viy41UJoj0FCfkxIBcj5XUfeaydJC01JD47CgdstbV/M2AIIajQ1nkbcpVWzVU+XxBIjZ8X2wgnPP+QrvMUBNw6T4bp/b7/Miqh1KK71HzErHkbcg8Z/2+PSW6Y32g4F4uzA4J4wbp1Jd/
x-ms-exchange-antispam-messagedata: h1WJHtMpvDcOkMRHAvHRaKI+ld827GJEVZr/7tVCqJ/Iym5l3BgjF2t3U+SKqd7AP42JzUPg2P06uNE/IyRZ1RfXapMzP9CBzuljRffWyeRaYbqpY/eL0iKqePPadl0O1rWaCy2cS6ebIOakRZ6eOw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddbe3b0-5166-43c6-6816-08d7a92350f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2020 03:35:44.2257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGZlhOQNXlbDC2FzXmWk86CxxTSmRJVkt+HsLlrFhxNch4lnILvuLeuSsRMCtgX6cXoONGT/HtECPqkVrF44DFmbsCbyh1pRvYWB3fZDFco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1755
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gTW9uLCBGZWIgMywgMjAyMCwgU2VyZ2VpIFNodHlseW92IHdyb3RlOg0KPiBJJ2QgYXBwcmVj
aWF0ZQ0KPiBpZiBDaHJpcyBCcmFuZHQgY291bGQgc2FuaXR5LXRlc3QgdGhpcyBwYXRjaCBzZXQg
YXMgaGUgc2VlbSB0bw0KPiBzdGlsbCBoYXZlIHRoZSBSWi9BMSBoYXJkd2FyZS4uLg0KDQpPSywg
SSB3aWxsIGdpdmUgaXQgYSB0cnkgdGhpcyB3ZWVrLg0KDQpDaHJpcw0KDQo=
