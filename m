Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89CD345EFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 14:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhCWNJn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 09:09:43 -0400
Received: from mail-eopbgr1320099.outbound.protection.outlook.com ([40.107.132.99]:2461
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231446AbhCWNJU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 09:09:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwWbWHz18xBpPW4ukHou7gOGcPc5AdQ5fXmOhb6k0UADJNP+2V9EAillcwmnCaTVcJ+IhKzlpcqfAsQtcN0+5rxXFmiCPwKTO/HpLLgmLswjAj/KlQrCOkJXYvy7mYOtWghi0JXBTIqOvlSEZM9w200M26EJRsQqExJv8R5hpgS/I4tvue8AcV0DK9uwAzUnCGHLZzjlk9VwPAQJXi99o1QlnPpCWpRUudMv8qHKGNNu5Qg2SKtdPz3vZp4PuMeDe6sfbcep8XsGwd+4zPWojGddTJjQOJ/vhEaMAhFw+w7ZyI2fhJqumTrmD5gTHgtyYnrI0y8PxEFv4nsSkkLjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xn866kONo186EMcdOQUqMi2Ua0Zne7ePU78TRdLivUU=;
 b=nIUC/keDrWSEPVBXULAYOTR2zeatU0D3R7pvZoxkocvahcwUIcyldbovUJXoBCYrXS/u/tHW+84Wx+tN7wSVmYICA5aOK2Fp55vcGQ7A3Y+/eW6CVd+5AQyWRXp/C2KlJTpo+EUWV1sl++lmpJIE58gGJPJll9A4A+8j5Ui0rrlJlOXEjnA1K29o7zp7eKwNtw5CDg8iOQbOdAuGOo5eHASeDmN/f1DgMB8UHeZLOUirqKqdmz98nafDForwcKB9/eIZhB4iiWYu5oLTU2w4muJWOx88zt8FAHM54ciCcD5kMh853gHF+LIg+ceISI4CFbHnkI1dT3u0rG+5DBMW6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xn866kONo186EMcdOQUqMi2Ua0Zne7ePU78TRdLivUU=;
 b=PlRkB7ZxsILGlkWaW5O0zHwxLNzJn189chTBewR9bsKr0Nze9smYuls2nozp0KR+WEDO71gw3FVjkVB6afyccjRa70LnNVeJuZNS6rI/UMnTP+YO1cwcs8t8UefeOY4zB3JZKWv3GWUxIi6h5tRi6ZjG+QkWgTYhZ+DEaDcQcMw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3514.jpnprd01.prod.outlook.com (2603:1096:404:e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 13:09:17 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 13:09:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH RFT 0/2] mmc: tmio: make resets more robust
Thread-Topic: [PATCH RFT 0/2] mmc: tmio: make resets more robust
Thread-Index: AQHXGkJkh6Wtpwh1wUCOWBmMcBi/kqqRkGgg
Date:   Tue, 23 Mar 2021 13:09:17 +0000
Message-ID: <TY2PR01MB3692FCF477321C7323DE41BDD8649@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 66c1b83c-70bd-4b25-acdb-08d8edfcdd74
x-ms-traffictypediagnostic: TY2PR01MB3514:
x-microsoft-antispam-prvs: <TY2PR01MB3514A0F654628B8170BA415ED8649@TY2PR01MB3514.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SzyAz8Zm1PpJHDTVJ2tUZz5mPO66LW8lRX9AG57G2Hw5wq5W3+8jx4B2bxb7yPrl/qSt5DETQdYX2HFG+roLAIvjaAWmY8SeHdi7L9iBfYBVjwM25hu1KfOIar+d78iXB0AWp+i/4SGPgbARkT8AajwoBV90Md/8V3+DXNjoo+VWEzhwgbJme2IEQaWCHOhcb9AVAodP1/yPLnUEUY7m+flZYrZli2AjZGdR3gc6GVwIQ62BgO5qQ++Ews/xw/+a6dr/Rd3/eRxT4nZTOQBwJgpE0CnnzgQgkrizbE3g4jeGbOSbM/8dqmNE4Te/0Sp3L//hRtmnq64D6/yruPMIzKsEDd7t0/feiKPPoRuH0wCFDp7RYQOPgZHI6hxisqzoT+PSDyutpzFfH+oKvHF4KiF+eOPHzpbyeOIdZA8w9b/MjroCVn5iO1Rd56A6xUQiTH0aHVdrCu29QUA6swoR/vQyASxI6lY77Lu9R2u2+gEOQRNmcDfuf4qJyfmHhDai09uztdaisNIyYdSuwOctkaKE9Y77NaK3N9B5wy1qcbTAmKbnwuf6zeMO2xQCnrvMgmJV2pgKSgbIXkjKImhPiL/J+YM2dneuAaSin+Lfd7kPd6Pe8Qf97xqReiBhdGPqK8gdMRp4ZvWmBOC3TJz7h1fagcm//j6yonYrXuYNVb8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(316002)(5660300002)(4326008)(52536014)(86362001)(2906002)(55016002)(54906003)(38100700001)(4744005)(9686003)(478600001)(66946007)(64756008)(6506007)(186003)(26005)(66446008)(8936002)(71200400001)(66556008)(7696005)(66476007)(55236004)(8676002)(76116006)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?F99zI/xHxiJbeDDd1nva3mduMANIyQZHKV8aIod+m28AALg8yqrEqHLwlFdL?=
 =?us-ascii?Q?KuhTOyniFAcyGzioJ5EwPKXsjkmK+J0xagOyGCevbDn8djsHtH8LKykZXsC+?=
 =?us-ascii?Q?9GWFhM9jU5YfcLTyMs2rY2k9GgcRtO/IWunrUQLO5txxvGxPKKnA7HFR90Nk?=
 =?us-ascii?Q?plw8WsZQEkjtDGx8BT2Aex3o7ihLY5/HiYijZTEa49GG2Iek99zei0RXTtGn?=
 =?us-ascii?Q?0sKpB8VBzFY4jr2ocS0TnNpjJwcJYZclnBVNWlhQedoa9/kl6IJ0mMwxbM7d?=
 =?us-ascii?Q?ejTh9yAIbGqU1WOTBTfhj+DcEuFYLnX+jGvQvP4Zo3Jw2frxnbYAeiErtqFX?=
 =?us-ascii?Q?FMcxDHusiem4fIuASwKFRrLlDnyadnVUx8M8slCqubGsymyKydMvMN0+0Lq4?=
 =?us-ascii?Q?oBxkg1K2ZnTKT3uzNTh5sAjCQcNzzEv61IBk3EdFY/yuymI9La2c/tNumhuD?=
 =?us-ascii?Q?I3spR9vL4fDgch+j81HD9ZWwep2dP360gt+xYqG8MYVuKJ7HGfPSDTcZDrD/?=
 =?us-ascii?Q?yqQitcWvOOFWsLZLzsOyZtRs7t/d+pkci8muR/ITy2BzNkIdk6m7j9todXJu?=
 =?us-ascii?Q?k2ALmd7oypugsXMaHCUhJEA6S/JHIZiLaQ0JumI1XgA127jx68fl8KMFK5nu?=
 =?us-ascii?Q?ewlUrj3rhNUL8M2tADYYZELsW4Pzl/FCaXBd3bfqBt1zl4mG2Erx4/zEgII3?=
 =?us-ascii?Q?yLjpfpgbn3nuU/aKkrcmgnvJIq5cw3Gv2hDe1gtVT5sZFSX/CM/H3ot0Izgj?=
 =?us-ascii?Q?7VoAA9cb3OBXJ89HtLae8XM061J30gxV7Z79fwhEzk2XtMEtKpgrQlLkQLfB?=
 =?us-ascii?Q?rPwhG9BRY4p3stu+TyhkPCQyCVzj6lVLlDX9JS29S5Gbdo/3JXEbF5CRF2xu?=
 =?us-ascii?Q?mpAPUDtfqrS7Gz8HIMXSRt5OwS4Ch+Pp3LEeUgmy9AmazOLLs7uH5P3trgMv?=
 =?us-ascii?Q?GVBkqxZOHMq+DaayDJ5jmVCi9Yl7UTdZAWQBA156pUv26HJaW2DtBFLKILio?=
 =?us-ascii?Q?eySFJ22fBhdqj2zWBGaSLBKDocJiyrs4WnCcIxSxU04p3fsauWTtVf43gUIK?=
 =?us-ascii?Q?2Oyr2KOmHpQFXnQiFVCDZlw7mMOvZt2o7ad2h5SewkmorWBYrGe7H+Y3ZVgA?=
 =?us-ascii?Q?LPNzrboh9+YtiG/YxMOoycPGQw98DcjcHl0TU4imEBc6KWPVnebFYFfFxE5s?=
 =?us-ascii?Q?UFRGRL7fMmK7LOv0/gtPGhbYU1EKmqBrnrFsBLKAxNzAiQEUujPMZlFQVfYY?=
 =?us-ascii?Q?nSi0ZK8V6E1d4YsGjpLfA7/YMnwijv0mHQSwtLzIBNO0/Ie9XZW1/E2mI93R?=
 =?us-ascii?Q?G189obOrAreU2KddKDQhAzcA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c1b83c-70bd-4b25-acdb-08d8edfcdd74
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 13:09:17.4698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjXKBG5+ky88ujj2Q03CR+8Xc6vBTkvRqb+1ItO3bAqv19o+XDRj/FvMnLZxV9Ww/P7QCxC1eB9DZhfL3KtwR6/4uJsygcWBtWucKPMK4hiR7xMUc/i3cwATwsovynYW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3514
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, March 16, 2021 5:57 PM
>=20
> Here are two more patches improving the robustness of resetting the IP
> core. Patches are on top of mmc/next and this series "[PATCH v2 0/3]
> mmc: renesas_sdhi: reset via reset controller", especially "[PATCH v2
> 1/3] mmc: tmio: abort DMA before reset".
>=20
> Tested on Salvator-XS with H3 ES2.0 and M3-N. A branch for testing can
> be found here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/=
for-5.13
>=20
> Some additional testing by Shimoda-san or the BSP team would be much
> appreciated!

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on H3 ES3.0 and then I didn't observe any regression.
So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

