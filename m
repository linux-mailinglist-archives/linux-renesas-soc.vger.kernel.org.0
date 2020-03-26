Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E93C9193928
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 08:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgCZHGy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 03:06:54 -0400
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:28496
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726210AbgCZHGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 03:06:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnTZDe9vsUdMIHYx8XlqJE6DAGcDYIkJTk4hPDDIt3CblemnKYtxa7u0Wct9nQRkNuSYXe+0HuLzH+cIKKvY3KDtg9OKS2QIX3pTcCanRe0DUyd22rwl4icO1JBe+dw7Rn4E5F55Pm/RhDLG2Gxu3heBJhjm1CpdYPs7FCUfWJgaH63YBPooVTjrvVrjjv5oZ7HePaovZe1nWbuYaFu1Y+5Iqr1aiD01z+F7HWNqmrcJ4nxSGxK7ZgtrgKtNZCKbvXqg/uSvebmwCT3vE59clgLgZyRCYSSYVvpPetHS4UYhI8RmZ+d2V8WsYEsEbzcsLb66/O5Xjvq1e5MUyHM+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=272c8k/XJTln4H9vER00YTihL/1BDhjQYFRtjcvOvNQ=;
 b=dPKOJKkZewIyb9AiV06xthB3LeT92lkuoqAAwWnIc4euPafVCjo1l7BmNJx0eUBvviUfnTuZmMNd7eZMXk5Crhe1yPdrR/el4D29b7FvO+3Chv8ADFimZ3ZBnPdeZ/gjBOhcBgZqAdlJZAzkITg9sZGisb7FjqFT2TT2uYUtWR8TtjC+e49mPQ4zUorYbexD0wCcmYg6gEGbsn/wDrzm40ekcCXN5yWz+AB3/zGR3tVE6lBILemgqY8u1MedIth8ZFjzpSrvV1yfzyPF6aD5fufxMwv5lBRSVAOK5lXt7wIGob3sPInOLVaBd2ktU5T6/fBYtLzOY/ZFUoo1WmtooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=272c8k/XJTln4H9vER00YTihL/1BDhjQYFRtjcvOvNQ=;
 b=Eic3hdCHIi0hhmIEECun0YKPdWpk2++43AqqHXrBRGvBVmDyylplrMtTa2YRZGXHsRUTG6okMte0aRC89jB8oGz0KOrXDk6Tb1NymODf/2OwUX+S+binaO2CK9FnVUB3/by/8FRabebywzKi2O0idwokpF9SzyeQoQ1ybhZx79E=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3389.jpnprd01.prod.outlook.com (20.178.139.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.15; Thu, 26 Mar 2020 07:06:49 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 07:06:49 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: RE: [PATCH RFT 2/3] mmc: renesas_sdhi: clarify handling of selecting
 TAPs
Thread-Topic: [PATCH RFT 2/3] mmc: renesas_sdhi: clarify handling of selecting
 TAPs
Thread-Index: AQHV85oc++lwtWbNCEOAQShmaK+G/KhakoJw
Date:   Thu, 26 Mar 2020 07:06:49 +0000
Message-ID: <TYAPR01MB4544FF63EFE722008A653C8BD8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
 <20200306093159.6155-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200306093159.6155-3-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 087f6599-717a-4fc7-ffb3-08d7d1544149
x-ms-traffictypediagnostic: TYAPR01MB3389:
x-microsoft-antispam-prvs: <TYAPR01MB3389DD2BAEC47C515F8D997FD8CF0@TYAPR01MB3389.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(26005)(4326008)(6506007)(81156014)(478600001)(2906002)(55236004)(54906003)(8676002)(7696005)(81166006)(186003)(33656002)(71200400001)(8936002)(110136005)(86362001)(52536014)(66946007)(66556008)(66476007)(76116006)(5660300002)(4744005)(55016002)(64756008)(9686003)(66446008)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3389;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PEhAXRl3Nre1G2/Mn7p8I1VJ+YnAMdBpcMHajfRz/Doi7x7E8BN/GehtEvQR9H7R7btrXn3/2ZF2XdXkaDEri68Pb1RZJvzxhwhrCQ+DITmXfkJ+TInW6qZHktZkcU+dkE0M6LsRf+ijW+oWRNYzTJ3HmVmHsHqAhyJT+Pw82Nw90ylWB+Zmw3neCRqBVRiqVuw6kNjmd5DuQbmM5cC/Q2YCizYd2z0TgnDzowq1hoXq4QQtwJD1RQ96mhU6Jhc98SKka5ysxejTavffQL/+axglJMZNy3GS4TEqgDZLsQ/MlQyB3JN7lWR2apdVt8/JdPnnaJF+NpdwESejjPVnsSshU87bGszAQcEzSWI71snOCPlzIGywB2217sAa5K5STek+SDO0d8hF91zcOz1vdUKOI66wD3jAcX0vfUyO38ikH0n3nHpd5TXsHUkSbO+C
x-ms-exchange-antispam-messagedata: kZGf0yQjkdFy/TfpSK2ggkVR1RRr8qe0ODnyXOjCpjZtM/QkUQXe39+KYU3Vr5XjGqwaXMwgkgtHLCs2cgtNW2vU2tEOuWroUuKUTAoIPHhlQ9H2olckooRmqDL63r/1oBAZou18mAfrCJXIMS0b+g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087f6599-717a-4fc7-ffb3-08d7d1544149
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 07:06:49.7362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VlWqaP3so/aWwJQbttu+M5KCzbXI0OTm7NIL1gQhD8CkzG5V9n3xztXZ70pDI7TDw7GxIfRslhoHr9O2dEA9aq1mQFJcsB/s96fQ4lW7vaXMy3/C8On/BbRSkys7yI+p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3389
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, March 6, 2020 6:32 PM
>=20
> The comment and the define about how TAPs are selected were confusing to
> me because the good TAP was only valid if it was bigger than a *_MAX_*
> value. Rename the define and adapt the comment to what really happens.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

