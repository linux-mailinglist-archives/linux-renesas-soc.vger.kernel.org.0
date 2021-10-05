Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54432422EAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 19:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236515AbhJEREd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 13:04:33 -0400
Received: from mail-eopbgr1410097.outbound.protection.outlook.com ([40.107.141.97]:50151
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234938AbhJEREd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 13:04:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9U3mcTl69pcM5wxaFZiUyZbB8Coh/7k13kTA7CFolMHZC4zzYJdi4LtIOXLwfX68AuhZap7SEzRaadhb0m64owo79ib0JSl9j9w5p6ftVCPdV7rEYVEqcffFrCsWczcgJrOnZEZJL9YpvzY91v+YM73dsEHlaynVtBTC6Ix+AH03Kq9d61QoWB2RFukzx6bmlqnhsOFxJUFks+11xPdnlv4+0K/xhesUQieiNEjuAXt2ZFLQH5xfJis5dlipXMsxaCC1O/6W0Qg39hPFj2+e5uaJvxZ+VLs7LFJUc3aj660VT68ztncDYIppS2wJan5pSPnEnfgYsjuxReZSQHdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YzI6TtSYW3tTEW4tJEVI0pE5PF5yXON8JcyZI9R5fs=;
 b=BxjPB27Ig3HMM5eXHPS5DSyaycpVikv3rk84VQ0i9vYpQU8R7s1Yv6AWzeUdKcWW9ML36OFrdHDzdebwITZJh9UH0xm4rKcI6Zq5ErciimNFGv8RaCyiDx12uBKyq0Y5xMVPZX1kmEKbNf/TE5dz7quq5M6P/jWFZb2A9fy1MWtbbOUea/QtF/+UxSy5sDnYMod1p0XtT2yO9LBSTjP4jJvRrOsns1qGtUGQ+rM8Hq4xQM9guIgjr1U3QhOrl/BoAgzc+O0/j54ctR2NPs6EHNafFYv3eQcZjQXQMfkQnKVpw/2NBRFHorQkAcw/xiNqUl7RtTDhfQkuMHIrqWPP9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YzI6TtSYW3tTEW4tJEVI0pE5PF5yXON8JcyZI9R5fs=;
 b=EQTUY1FV95F5pp+6YSUbXLY2Q+MDLF9dIxVd72EbQ5VP6pVBCRTa+deamyX/RN3zT30fbSa8gf0Ld846dXDF41kUkGU0hO/j9HVpnHIoAxydwvl9AuTUQz3DyCz9tx+MShM4GbvpmJ4xtfEB5G9l9nt201V6nnTOzJYOhAnhHs0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2802.jpnprd01.prod.outlook.com (2603:1096:603:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 17:02:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1%3]) with mapi id 15.20.4587.018; Tue, 5 Oct 2021
 17:02:37 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Thread-Topic: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
 SDHIs
Thread-Index: AQHXmlNVs4LNmIzCAkCmNj25qUqILavE3GMA
Date:   Tue, 5 Oct 2021 17:02:37 +0000
Message-ID: <OS0PR01MB5922BA32F4FB02E3390781DD86AF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210826082107.47299-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02953946-c80c-4b23-1bac-08d98821eef3
x-ms-traffictypediagnostic: OSAPR01MB2802:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2802D04C079B9B080D0C66D686AF9@OSAPR01MB2802.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 90FAPDlWfZpqDg3nEUD9cpO/nU7SSY4zSyIBiz48frCMOlNIgliXMmoWWes/IMjdhvjNb79X9509MhpPSo8ROlX3HUj7XWEQDckKlDxDOylj9h7SSVKXC3baIFUIMRYQ2jIHctkK83WB4F2ehHOgEEf2RAHzrUJEf0h+sx1Ren02XSjRutrhQt2e1/q3HFwEh8Kb2wN3uZFpAuyw3OWTB5+7PJaGPq69RiFIsUYeEVNwQGyXPECdHqKnxT9yTXiklMSgB7Nc6zgTbtpaolqaQsT8g5Z3yjf119evTlSIZQdHF4zgARr6u2ru1DZ5eMwxZbGdbO569+c1GrqGKkw09lhCceYBG2Eu0DFJAkfaFfodVxj2qssqGewHy7QW+sKtpuTAM8vvIsTCSOaz7lJlDgv5QA5aau2w6tGsLB+hjDIImGm9BDZ70r1ReggpUqyGLZWj8QwF82KDmuysi5B7L8eT34VyDVg0cSJy6pz8l7NTStPEtyf4Bi6qBX4uNAlkVsp5sgrxRnMJ7KtzpIalHE+G5uP1hpYxF4XYzC90OJiz/94Icc49CbQFIx+stTPbMrBqVJBoCYF6MFyzKtlwR9dN3iKGgAx1dmx042SiLTxY2e3+IgoKwUjfSv2EwIL58O5GpMMLQUiX3lf3s5T6juGR9QLlveOinx4U0agw4IJd9J9ALz7xfrfFJLVaHwuRCi2KZUARo/3WBBeEyDkccQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(76116006)(4326008)(86362001)(8936002)(26005)(186003)(8676002)(9686003)(66476007)(64756008)(508600001)(53546011)(5660300002)(38100700002)(38070700005)(6506007)(122000001)(7696005)(83380400001)(316002)(71200400001)(2906002)(110136005)(33656002)(66556008)(55016002)(66946007)(66446008)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M9KQXNJNoSWMvmY+T6jbU89qXAfRTSP09FjhTbK1p6bzpYgnjwVQYkIubgNB?=
 =?us-ascii?Q?igKYL15PNnk56ua2ru7Y/dzC4rVVkj7dH88HA1e3pVNfYmCynr39NzjKCUJe?=
 =?us-ascii?Q?CuvzZyx1L/2cqAp+tNBYjqrJvVM+MYxMnutBEG49PsiV/X4bknmaseoJB/dt?=
 =?us-ascii?Q?rryNSwdeFOkMtM48Ss9Lj7oPo+E+UWnXJqZ4Ma+CI+Pa4kd8wOBPOGdRz5x2?=
 =?us-ascii?Q?R/zRiXrrU5lTUAkUD8UFEv5cs+/k19HuvtF9WTGq5cQ2gCJB2iN+wDjldZ1D?=
 =?us-ascii?Q?X8zyiETOeyiGCJwL2ayZparWVNqbBtUfhJNhszAwb4gV+JcpYz2JvclyaBM7?=
 =?us-ascii?Q?lX2J8JhnVLu7txKAundFkHg7YDtMJqMBw0avP/33X4EN8z9vuiaUhUFCvIqH?=
 =?us-ascii?Q?sZ2wVOSOjeRbf4a/mTxciAeSCb8KssUFruQP4wKH1J/T6akCJQCxvIn0fJEu?=
 =?us-ascii?Q?h9xmjVyjC1Hg6ExbjbDAC+W2fF6TGq1uG+CWagU2b5rMb6m0ok8XrAYoRKx6?=
 =?us-ascii?Q?0wsTFh1+EtLco9JhN0j030yHXezq2bHM7RpOC8nKczNWburX64BnZFWG7AyR?=
 =?us-ascii?Q?oW9gUzA/ke251j3/uQ5aTWjEO2/U6T8EvGJzqiw1fXfTXsvltJeQallsMiQQ?=
 =?us-ascii?Q?xpGay//Bp2hvHA6HMeUbH3jI1c+vzvtYnx+PRo/p4HSiq708r1iINwk8ESl+?=
 =?us-ascii?Q?jJbZEO1PEjk2y4agrKlEhnJ415PMJwkWo5XFXhRO6HBchE8LH9/XWGzNaqIv?=
 =?us-ascii?Q?ztmDabb4+CNiUUdspsMXE+pzAtxNEMPL7YJ3abfMvGbMfU5OxNicWEYmVF1p?=
 =?us-ascii?Q?Hz/rSKwXn41UWbDBeZMZRKtWVQjArO32Pxvc5av0YqCcBkY7nUCcWr6I3kXw?=
 =?us-ascii?Q?fhhAKTJ2tPtbqzxIUDUKhDv25cKHAcnoCKySzJ96r4Av/I8PwxgPiUeRwVMG?=
 =?us-ascii?Q?IbY+w4xT1fLgVONDWQuRdO7M4PcWGdJqzNk4UPtk9W0epA8fzT0YLTKbqAql?=
 =?us-ascii?Q?JOyWDBr6pALYLFdgV3R1FhKyKpxHGW3nTvnQRfkntT/HAunzh0LYpAFfkjcf?=
 =?us-ascii?Q?yUVD2rq/xoDyufzhBBSwBxC5GkhCwkVegWuUqs2O5A001op/B5hDXU7Rxi9t?=
 =?us-ascii?Q?Mh0xQyN0Tr+S5nLBf3Xj7utsodMVh5PhiBgCkMSJrOiHct1WtX8ZGljzyAj4?=
 =?us-ascii?Q?Xu2JxidZO1md54NDqgQc8dGXSWDs3x1b5HgwBN9IKwt8ArEUKh+fPuIXwBFv?=
 =?us-ascii?Q?UffMFW7lTy4dqG5feqMlv9zSdAQ/SiApqiJ8xioary0O1TBCNL2yzaZliWt9?=
 =?us-ascii?Q?f4z/NJ+9hSWFnBQgXwXyLDe7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02953946-c80c-4b23-1bac-08d98821eef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 17:02:37.1982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S47p5iQE+qY7KeMbbT1ww6w746zK9Zf+D4haqu9+VznHxXM6Bnl09aEGOH/EYbNYbiPq3DCdhzR4IP1CUal5nAWUuegyD0QDG9MgcKNKafk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2802
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On my RZ/G2L board, if I configure card detection irq from SDHI, instead of=
 card detection using gpio interrupt, then it is missing card detection int=
errupt after reset.=20

Just wondering, does it work on R-Car with CD irq from SDHI instead of card=
 detection using gpio interrupt?

With the below changes, I am getting cd interrupts from SDHI after reset.

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesa=
s_sdhi_core.c
index a4407f391f66..32f34de1a2a6 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -561,6 +561,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *ho=
st)
                /* Unknown why but without polling reset status, it will ha=
ng */
                read_poll_timeout(reset_control_status, ret, ret =3D=3D 0, =
1, 100,
                                  false, priv->rstc);
+
+               tmio_mmc_enable_mmc_irqs(host, TMIO_MASK_CMD);
                /* At least SDHI_VER_GEN2_SDR50 needs manual release of res=
et */


Regards,
Biju


> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 26 August 2021 09:21
> To: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Wolfram Sang <wsa+renesas@sang-
> engineering.com>
> Subject: [PATCH] mmc: renesas_sdhi: fix regression with hard reset on old
> SDHIs
>=20
> Old SDHI instances have a default value for the reset register which keep=
s
> it in reset state by default. So, when applying a hard reset we need to
> manually leave the soft reset state as well. Later SDHI instances have a
> different default value, the one we write manually now.
>=20
> Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Geez, typical SDHI nastiness here...
>=20
> Geert: I think this fixes the issue you saw on Koelsch. It works fine on
> my Lager now at least. Can you please test and tag if all goes well?
> It would be great to have this in 5.14 but it definately needs Geert's
> confirmation first.
>=20
>  drivers/mmc/host/renesas_sdhi_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c
> b/drivers/mmc/host/renesas_sdhi_core.c
> index 6fc4cf3c9dce..a4407f391f66 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -561,6 +561,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host
> *host)
>  		/* Unknown why but without polling reset status, it will hang
> */
>  		read_poll_timeout(reset_control_status, ret, ret =3D=3D 0, 1, 100,
>  				  false, priv->rstc);
> +		/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset
> */
> +		sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
>  		priv->needs_adjust_hs400 =3D false;
>  		renesas_sdhi_set_clock(host, host->clk_cache);
>  	} else if (priv->scc_ctl) {
> --
> 2.30.2

