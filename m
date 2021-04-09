Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6A0359215
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 04:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhDIClv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 22:41:51 -0400
Received: from mail-eopbgr1400111.outbound.protection.outlook.com ([40.107.140.111]:30426
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232616AbhDIClv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 22:41:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7UjrHNZbHyRx1M3LwVuJij22AKNIgajsKu73EFZ5RCx87GE8B+NE3VwJoo0RMOswX9km2b2sgNWr5+uTG6x97Y75FEVsXuiNnBYwQ482gqEAGA46m1DWfW01HtA9hh9HGAP/+hQmpjtok+eH2GOQUHNBGiSn5FN/kgoygEKaCJ3iAEOUoqWzYcNHvbu9CWsfxYoeK6PYkS62lRnTpJ4rkcmc7OU5RKOkL+/0eGl8et2Dz9BQuOsTzz5vTc0L/E8F2q8Sv23MRnHYTeMI0ezJNUi53lR3KrGD8R2hQ/z0O/ViQr+NAx1Ji4mOFwnhjx1+ndRQn/mi/q/IruxP4CQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo0VDCCUrXnQLtMotYrCIjpWDnyG3gMZgROnjiBNS24=;
 b=dB3CPohfzQXWNcX1916CJOVGfB8Ylon/TTy8pevixGwwZHnveTRzvngnX4HR5v/Rm685smMeC4zGMweeafhbtq5k1XV8tAWQpBOEEgRaIbz6I6CPJA0umbUHdCP/TN0eMcG3H45i8ljW8H0a54/C/Oxtbd8wnaMmcFTmn+ZX7q1y/qjSkH+zd7SelNFrJ8ta/MAslWsPS/g39apdACG5yW1E0nXWIAddsdiuksv6mex1dSjN0oQjL4DVDZKjm/Slw6BSNlfBo1ztMse/DLl2FfEQ7LcmSG/iWJOvWmsnJmx/mUk9zelgOKN5JX9xtJfIL9k8T3Gr/vudbqLSjQ8K/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo0VDCCUrXnQLtMotYrCIjpWDnyG3gMZgROnjiBNS24=;
 b=GaV8O2F24mip/VLDlJnBvIOQEDJwo9cRXUZm9LiTpJ4iBqoHqNfHkCzHe1DK3sDljv1UihabRbO87b1YXdL+ey+kO7DjuYqXQewRsoR+PSkhv56OyFzzva+wX79dIp3icyBjW5VCwkJKUNAY8n9oVb+UzLCzAy3YbcgwGly7l3g=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1549.jpnprd01.prod.outlook.com (2603:1096:403:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Fri, 9 Apr
 2021 02:41:34 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.3999.032; Fri, 9 Apr 2021
 02:41:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH RFC/RFT] mmc: tmio: always restore irq register
Thread-Topic: [PATCH RFC/RFT] mmc: tmio: always restore irq register
Thread-Index: AQHXK8MZX5fXt7xro0uB46211W0EZqqrejvA
Date:   Fri, 9 Apr 2021 02:41:34 +0000
Message-ID: <TY2PR01MB3692C98A87BA89D0E910807ED8739@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210407153126.37285-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210407153126.37285-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95d6460c-5374-4bfa-3b41-08d8fb00fd83
x-ms-traffictypediagnostic: TYXPR01MB1549:
x-microsoft-antispam-prvs: <TYXPR01MB154961377C3BCE24EFB59030D8739@TYXPR01MB1549.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PBBhCtQgTHu4XmJ9YNfY2YQLIAggzxmXqm6+qUnGFoUshLKl1M2dQgAbQBuyJbP18cW8TRnywgEWJKREhO/70Bhxz3AU86znQ0GcmsEtWt1XWo1m4KznfulPd6oqX4qj3m79hpyUNbkPxmz5ljh59FHF3NecYD7YLlbRtjwm2bOMaty8enRWKFhAItHt/Idx+Ufbuj5vSwnFcJNbxLMkXjBCP6FLm0Jzoe8MXhcqFa2lXvmksRz9TbSGuLAZpBCGKKPkpddBSycPKXNLSZuQIkhWkwn+CSWUwVMKmdAleSXirAq+VN6wz1tp8oIH1xUPTm6O7sFWHtQjUUcVqFCGMqd1jk8kiXB9ZF4eWf/Nc9lZBNMrAPtZuu0DErvFfYejHPK1t005PJKbe2tat1SJMgz47TTE0rr0A+CpK8J/qKbqawg10e47TRx8ay7JzmDQokjsVipoiSkKqOThK4sgafA0JE98XYRL1jd8akZceURpZER1ORwpxCtCR3f+E1mR+GYsB99ZlM5VHS1LGR+DQZGc1DlHmwlA4faOmHUOjxcb1qYmkNR3nNQnZFhm1PS4Yk1LVggKaCpcAwlHWFPZrHjKaH2cK6rsECnF6ZNExUDdRztMkOaTMsXNQ5Qw4Q2A0OdVKinAOvm5H5UWashVoygKAIaV4WmXSHXALexrmBc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(66476007)(66446008)(6506007)(66556008)(2906002)(64756008)(26005)(38100700001)(66946007)(52536014)(186003)(4326008)(7696005)(316002)(86362001)(54906003)(55016002)(55236004)(8936002)(71200400001)(76116006)(83380400001)(33656002)(9686003)(478600001)(8676002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JIaAYtreK40GcphHH9QOGveT+h/onVVp6VGO3ni/yw/EjpkTLxm7JxhMz9oy?=
 =?us-ascii?Q?5azfF9pWltnziTlczryyNulhUSyxcVMOf313FToVoHUtkahp/6pzuHUH6X4Z?=
 =?us-ascii?Q?/4EKJZ+gbYJ2+R+P6gOo3apxrItg53335xObHVIrbhUvxVM5ai+G8uwqd2e/?=
 =?us-ascii?Q?u0L/+ijWQU6o3lQ9UitgsqtIPdiOYC0T44+miRaX2R2JC5HnGBXBzkoMmxqF?=
 =?us-ascii?Q?TjNLkg4ppvDlJeHB076wuzKDNMUj9cmGdZtL4hT36Y8Ibws/9e5SfmfdiSbV?=
 =?us-ascii?Q?S+NVk5x1T4EOYZk5j7xdF+ODMxmN79nalqmvO/6cWLppnoz7UdL6uz3B+Iqv?=
 =?us-ascii?Q?8dKAb5yswKiAM5T2R9+vn13UnD8mRk6znJThM0Byxw6f/rMvGeDoDmDLtKIB?=
 =?us-ascii?Q?akIEYaf/1x4HbQa8ICMon5C58Dfr2o9WVwPTPWO8ATvTPtTuFyQ8lt+ZDPHQ?=
 =?us-ascii?Q?hsd5x7pnDJhn1wMLQDLx74X4G9kpIlgemUvZ5OcXn3/1naiMa4A0MIxlDiN6?=
 =?us-ascii?Q?thGzUwRFalrAqHqyM6NHnCx20/zu7cUemxwQqJ/4vGt/A8TVf1zvIlIy5l0N?=
 =?us-ascii?Q?GWoPb3Elzv/DtjjLkio/9eMBULhBYNUWBS9PZUrgJcHSB/ap8hnqDvshE09/?=
 =?us-ascii?Q?88ObXHXGnUyrKHyClpk6tWKozwTHmNHIQly4ogh0hfmF/vXdeFDs/e+B1WZB?=
 =?us-ascii?Q?OWF+KaXZrefvWlv2LLXcW3aHOFAT0fi+Nz35ymC7bPhtjbCeDA7NW91DPsZU?=
 =?us-ascii?Q?ztOMwzQJ0tzkuuwVYSMNX22k53Ca7aDwALBXCbOrl/D1mVPmzl6KSu3GYIWj?=
 =?us-ascii?Q?gisPHqNzC0QUyU7wgX3k21AJu5bEkvN9GHfeMOa01Ef0H8MWVD1xPviKxd/7?=
 =?us-ascii?Q?PtkxbA/K3M7PI8fGtIz7D6NAAUae+sfSz5GdHQCGWItZvsGOlrPOKXDskffe?=
 =?us-ascii?Q?imVIQwE2Ey8NHUF4KTi0/tTvfkIbDQshFVxsi4qfNFadz/3y8urOAofDhpR/?=
 =?us-ascii?Q?y6qNt8Xqul7YjM5se5lcmooNlfVHMc0hdrR9nSfRqjGMBuhCr7tyerBa/Vmp?=
 =?us-ascii?Q?KD0Opoo5KqGMtDzBKZl9L3C7NIJ4Meh8tRB7qDiKI2QxQF3bF/F5x6GeDReB?=
 =?us-ascii?Q?wxv0ML9pknBiS8xYek3WIeO0Z5fSCUJerEGNESKiBBifZ0c20t/EtCSuYYoy?=
 =?us-ascii?Q?hT34yefC6HrwtAAP/lZVK/o3ETJz6f2suCG5wrvFVNAX5ibQDp9uY5wrCgeJ?=
 =?us-ascii?Q?2yEvlU695n9Vyk30SqLZUnxKNzWF6aE5Co8oMWogi7GRlc+t3ZZ04Qv9II1T?=
 =?us-ascii?Q?i7vbgb3SCSHsIipC0kZQkVPR?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d6460c-5374-4bfa-3b41-08d8fb00fd83
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 02:41:34.3463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kjff0f+pRiR+rlsCjqEi8Vc3csHRpxIG5UPMmMftAz+YVDV3yoMkJeDGE9UW0L9Pdb129GRs3yXXtjtphKTrxJv5AaPDmAfVDrUAdP1t8ZadZy5Uci0jsEr//dlS8ZZ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1549
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Thursday, April 8, 2021 12:31 AM
>=20
> Currently, only SDHI on R-Car Gen2+ reinitializes the irq register
> during reset but it should be done on all instances. We can move it from
> the SDHI driver to the TMIO core, because we now have the
> 'sd_irq_mask_all' variable which carries the proper value to use. That
> also means we can remove the initialization from tmio_mmc_probe()
> because it calls tmio_mmc_reset(), too. We only move that
> tmio_mmc_reset() call there a little to ensure 'sd_irq_mask_all' is
> properly set.

Yes, this is my expectation. However...

> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Shimoda-san, I think this is the implementation of what we discussed. It
> passes my tests on a Renesas H3 ES2.0. I'd be happy if you or the BSP
> team could run their additional checks with this patch. Thank you and
> kind regards!
>=20
>  drivers/mmc/host/renesas_sdhi_core.c |  2 --
>  drivers/mmc/host/tmio_mmc_core.c     | 11 ++++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index d36181b6f687..635bf31a6735 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -588,8 +588,6 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *=
host)
>  		renesas_sdhi_scc_reset(host, priv);
>  	}
>=20
> -	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_ALL_RCAR2);
> -
>  	if (sd_ctrl_read16(host, CTL_VERSION) >=3D SDHI_VER_GEN3_SD) {
>  		val =3D sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
>  		val |=3D CARD_OPT_EXTOP;
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 0c474d78b186..bcd26056d47a 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -192,6 +192,9 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host=
)
>  	if (host->reset)
>  		host->reset(host);
>=20
> +	host->sdcard_irq_mask =3D sd_ctrl_read16_and_16_as_32(host, CTL_IRQ_MAS=
K);
> +	tmio_mmc_disable_mmc_irqs(host, host->sdcard_irq_mask_all);
> +

This code could not resolve my concern. This code still read
CTL_IRQ_MASK at first. So, if the register value is incorrect
(when "host->reset" didn't exist), the sdcard_irq_mask value
will be not expected value.

So, I'm thinking we should write CTL_IRQ_MASK with sdcard_irq_mask_all
by using sd_ctrl_write32_as_16_and_16() instead of using
tmio_mmc_disable_mmc_irqs() at first.

Best regards,
Yoshihiro Shimoda

