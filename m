Return-Path: <linux-renesas-soc+bounces-11136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90A9EA6C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 04:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 680511888EE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 03:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9693541C6C;
	Tue, 10 Dec 2024 03:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WOpGT33c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9923C2F;
	Tue, 10 Dec 2024 03:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733802327; cv=fail; b=gWE1QMn2c3u7K5Dzg6HJAR1ERN0NdniQ6+tHM1DDPpCROpDnDbFNI1bUSopbPmkyQuiS07IohVLXzEmWWmn6zk5JXgXR2dBdKR+6Gw57R8f9rzhJe5Aom5mqZIDJy9gFLeW8YxIpPGbsWWmR2j3sfXQOhKjM4xmJaQtQrfw+E18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733802327; c=relaxed/simple;
	bh=zdyCuLcQ33QVLbz5CLFbrveoMT1QiCe08sz2Flydky0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ARuEXiOlnB77JhZu6/LssWObJYxNeRRdQa3IU3ykpHitO6064xti8Rbdy1vSfdYsTYhzbrCo3qVCkFLA8nsqWPM/SiUNObRqEYy2eZ7WRjHD9QrFBnAYtPH44KqjvvhXhmia3k0umRQ5Z4LXTXFB0/mwc0M8IEL4eWGaA/KRQ88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WOpGT33c; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb56/Z0k1WLT6XxZh+UlvM0A9opIbX+MpgDfYnFJCK0gtEJks4f4JtpeYMMhpEIZwhrrflOKD4+T72z0wmRhOT1e6FYCeXCbQWwPt0b9A4a8v2YXcNQubm+5FoaBGs5lldbuw1T11qD/0WZWruAAvCT0eTutCIJ4Bunu047KXN/c0P2dwnraB22bZQyELCCm3HIDgjfyKRdjyyd2/UscbBb5DRHUreL037dIknUz+21Pb2cJzoL7k3U/Vy/6Mn3HYoRJ/cPTGR5F1KhlsgvqAtrMtyL0hcC6JB9XCmqBgR34ZlkKCJ++jiqRJ2E+yqR0aDL+ZEvprAtPAySXmvyrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLRRKFTWDEQxUTExSjeWtlps48OwPc/EIi9+WGIQsB8=;
 b=gMfu/+0liYJUlymlRBsrOk3iCjjYaZusp9JZ7E1XwUWR9YZlraEaswq0s5rIcxnMf812OYahQMJRWvnrNAwTtc3oM37yjEMk39sMQ9kmfjsf+2B3npU83gahHTb9Oo9cImb+JwcbX4dCfSVLPVFXtcCFuymWub0U4/w+u269jHKPB0MhDKyTGvONKPKp0e+EujlaPl9Igy6qx+iC9xCaILDEH7GW0kvaf5rBQAmc1J0/ZOjrwPmE/bCrS9w7eEhIu2JoqokxqsWmCPZk+sBCQmfMLFUIvQYn4pbVhkWYE5daueTzXNSrd+1XU+GnrKDImpMB4bQDWbTmnFUrsWn61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLRRKFTWDEQxUTExSjeWtlps48OwPc/EIi9+WGIQsB8=;
 b=WOpGT33cA7EFQm6U1Qopi9qQ4rVuaccWxVbN2Ure+pvHOYtEmIsBQ7aoxiPIkQvIw4JDMo5QZ08MWS+VMrwkm3jBLot/pUfoAd0vQerbzFZRfnFl43SQA+WlRoebdEfp9Q47v/7wVGwEHW8FZJQYHCK4pU/fCes16K1OTbBZYTU=
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 (2603:1096:400:390::11) by TYAPR01MB6378.jpnprd01.prod.outlook.com
 (2603:1096:400:a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 03:45:20 +0000
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562]) by TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 03:45:20 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: nikita.yoush <nikita.yoush@cogentembedded.com>, Andrew Lunn
	<andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net v2 resend 0/4] net: renesas: rswitch: several fixes
Thread-Topic: [PATCH net v2 resend 0/4] net: renesas: rswitch: several fixes
Thread-Index: AQHbSVaVHV5EFPR38UivJMIG3UPOmLLe2LHg
Date: Tue, 10 Dec 2024 03:45:20 +0000
Message-ID:
 <TYWPR01MB11030F47568869C13DD40966FD83D2@TYWPR01MB11030.jpnprd01.prod.outlook.com>
References: <20241208095004.69468-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241208095004.69468-1-nikita.yoush@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11030:EE_|TYAPR01MB6378:EE_
x-ms-office365-filtering-correlation-id: f6a30b8a-cc1a-489d-e4ca-08dd18cd11ee
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DPwZiRKBw/zHHEywk1RWeIeUyD6dZ0thGU4Wdcygi7PwyTMBK1mAyAoEuxpL?=
 =?us-ascii?Q?6mJJ1uMpnujVAZKSsLA4nx0l2quWpOeayDlzMx7GeLfS9/SXIo/cSSAv9kbV?=
 =?us-ascii?Q?BG5emKIYik6yUiYO/Y3GLJ79Gn4S1J3NI/0VDou1O/PDU3wlZrs2D1Jjj/++?=
 =?us-ascii?Q?X2XgcZmfzEEYP9dOekhCnHsIbrQtMlih8c956lmrEvO1aSk7Em76FPBobRlg?=
 =?us-ascii?Q?77uNcqhffCdpCS2TBUd9oYe2vkpR7DFCjXMtE14HWqCtaxv3viZxh5zlYUM6?=
 =?us-ascii?Q?A61mrgMUefOW+wmi1qF3ktvKMSKgS6kvgQoOcSaG/PDKLKN8T9Iqc65ho/w0?=
 =?us-ascii?Q?GS2hzas/YCePuLj2iFLNgfMHTF4y2UOzNUNhSGkChfzEpqLM+ePjdNuCv8NZ?=
 =?us-ascii?Q?PqwRtIQvHvCr2USM+uwJM2GHAzBZtu1MoMxsiC/kQhUjg6Jw3yG75NXO9CNT?=
 =?us-ascii?Q?VdFeQn081ktwPy50Z6cdsnwgg/BnNPq2BZBcGJo/DF0pp3ZXn7RuznpMh69u?=
 =?us-ascii?Q?8Mw3O+p+bYyHD76ZQcfqgMUlaRLFuURADtPGta56mBzOoU+r8zobergm/HCf?=
 =?us-ascii?Q?JGx7SGo8kHDVPpXH2zdGPfH8aEsZNIaX32JWG166gGOigfWfa8kP2xNxXOt0?=
 =?us-ascii?Q?9dxDaGh87TvcruIj6d5OUCbnh2pSujFW6Hiz9rJY3ohXZgkO+5TLsMC9iypp?=
 =?us-ascii?Q?6cwWbZ49rUEfx3Go57wK9V4L+1lXtxNTxG2JRndLSGTA1WOurERKh2/1jx4r?=
 =?us-ascii?Q?l9j7SSagUvcwJnCE55MTqdrGO16fWL340U43xW33PLslrR5VbQuwdXGuK9j8?=
 =?us-ascii?Q?wsyZ/k8BPyMiq8OI+/QuVauhUD5Lr/Z//1AjAB0Ief1CnHbenb/EW4rTNrXY?=
 =?us-ascii?Q?4a8YvRM9CTw8+59KKq52NRFG48EV6cofk70qSNP13gTLreZHel6UGUkplC2S?=
 =?us-ascii?Q?Uq439LMnLqaKgXoVInTN+yrvkiM++s5y8SqS/6+r+X2s024Ise9X7Vv7XMCh?=
 =?us-ascii?Q?QYznGPuhVzaVXZsnyemqxK3MwsyTrQM+e+er2y5zejAQ9gtY7QkkcZVdHWAd?=
 =?us-ascii?Q?NQX8QgGotMWETI/mRXjqoZXInvxhrjBsd1PsowSEG2fBxopkQS/WPqVpYy8W?=
 =?us-ascii?Q?p890jGeZgeTocFVLxKC1k8Q5Gdy5K0fXJIsAji8vpB6EW7y6LZiU+cnAaQ/7?=
 =?us-ascii?Q?+GAQ1J3hbxQO0iedsGghHqyyroY2oa0/DJw8dagU6eu2yK3x1zmJ5xHeFbMu?=
 =?us-ascii?Q?4fDstfQoDl/bCwjnk8tM+v4U0An7siGTfbP2vX12TRPAYKiUmZ6kX8P0kAaW?=
 =?us-ascii?Q?q9s8Yqwnh/S+LujOtYWOoXQA8/vFDuhLpl+S+Rn29aVlP25B+l8pFP6rA24S?=
 =?us-ascii?Q?cZN+VUW/Xe2d72FMJ0EfOhNKkA45xuBiHGrQgvFolbAkCA59fQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11030.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ARWhBaCvcoouhD4qqRHeW/zEuIpb8Fk/5P6g2dP8RHY7e7lOybgJgvVR6Edh?=
 =?us-ascii?Q?kXZaSz8LUiIS2Sb7n0GVT9XtvbXE8asYPxSJVcWwLzmn0Izm8e44qiYqta1T?=
 =?us-ascii?Q?Tm/5wxrbDxKcuUNcfKWfDyymj18btE0NJsBeEtlPEaKWD82mtywmGwy0qvR1?=
 =?us-ascii?Q?ltMO1kOF4aKmRrNynkKaRiMfyREKMOv1ZG8mvTnWRYfWPheEzAsa2P/8kCxz?=
 =?us-ascii?Q?Nz4vdPFaxUi84R42y+FfZ93wgnjnmov674sSgKouhtVgeayQ74tw3zc10tHF?=
 =?us-ascii?Q?d9J3i5rHC7RG0TnvIRwCG403Lk7v617ddluKiMrqteDOnCdk1TCcEXJ2rmgo?=
 =?us-ascii?Q?5z8cclmTZPUNu/ycy3Wx4bwsJbpHZDociau/0kn2Ly7TbX+Ya4c+kSD1qwp5?=
 =?us-ascii?Q?jCdEYy/nfgJXS0OUehd9xi4SkDKv0BShhb4xz/F5Pgj735e2PgWVS4OCqCPt?=
 =?us-ascii?Q?J21uqkD7nGgD5qnN/o1BEJ8gIl9k79VFOpZhm7XcagRytawEa4Ov5bPDEiQ2?=
 =?us-ascii?Q?pvIzexTwnvx7gVHwscy2CzekuPOcMQGAJA/xrRKQn3n/Aby3axyet57rrXvm?=
 =?us-ascii?Q?HiYTGDqgRpF0Zp6id34INUrSVHS0U8eqkGjm88VCGOtyr51LrnrakkbJVSf3?=
 =?us-ascii?Q?On8R7EUAKQ7rjk4lCsviO7/ZkfdVxFasj65dFh4EAO+P9uwes1GMU9nswOhr?=
 =?us-ascii?Q?6Q+HMEx1tY0EvnASxfrPowxmOG8w8CRUuiasogGMkAQw1Te3WLPSrVlYOGqT?=
 =?us-ascii?Q?kvh3eKNudtKVju7893Xtzhl1Au4TBHuuFXmrYHeqhEjj/brbx8gdI2h1b01R?=
 =?us-ascii?Q?Q72xgpOyDkWhZs8cElIYe775KyIQvXsFQQyRJefXLqCKD1eImcwhQ27BJNDL?=
 =?us-ascii?Q?AgPHkHMZ7U8fgFMw9vwZzlg+J+qCQKqStUbUtegKS35d+loM9dJBAcCXiGj4?=
 =?us-ascii?Q?rqL01xN9SeF7Ilp+WBE9B3hZo/T7NMiKyouX7aKKr4TTzS5vrNwE0/sUXa7U?=
 =?us-ascii?Q?WdvNS3BotMRLp/cyhmIX41fdi5YeIq4yAU9WaMufnft5fwpRFVDUvDx5HZJz?=
 =?us-ascii?Q?7WHju8hNyVIYyBpA+MUGg0Hr1FW7c6WR4Ll0vq752TY5whCmnEiFDFZPl/wi?=
 =?us-ascii?Q?1O52INqRuWxAg54aPbtttMTThtMoLn3bEDcf6YHz1QutrPs1P51n2186tcIy?=
 =?us-ascii?Q?jaXD3RI2sKzFaFtsTh/V41A+5IBK5N/UPfAQ6L1HnAMcjQdNBLS/qEVaD1JD?=
 =?us-ascii?Q?nl9AW94ZSsLp6yjDQkBBKct+Q8Dps2ybBRWTjsF3K+WwdtRPtDCPC1FXCCSU?=
 =?us-ascii?Q?4lBV3K6XBs3XGl4maRN1sGnocYlW7TMorGxoBfGjsrJvVJi/BVXzggdhPEpM?=
 =?us-ascii?Q?3hB0cp5ybGF33dGV2taFqc6FL5nw3JSA/D1B862uVxOrl6elU9sdKSTDWIhN?=
 =?us-ascii?Q?ykmlbFO8Ex0txwuFu6qvTCOTP0oHWpExpH+9/KsanfNIjDP3R3Wt1nPVewQF?=
 =?us-ascii?Q?gh6SR3Ehs/Tt2B1mylXLsatB+6bxqDpNcDW/SRv16buIq8Hl5ZCnezHcA6g6?=
 =?us-ascii?Q?oce028fZI5AJpFCYWTaRSfhyzlgZ+UVcZSeyyQmoi2zHn16JL4xgTxUifrJF?=
 =?us-ascii?Q?yqmBmYtWUU8ypPbLXEcXENVFUwoHnEIOitfaSPZluKff6v3DO6fhN/EbBlw9?=
 =?us-ascii?Q?ABZ+mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11030.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a30b8a-cc1a-489d-e4ca-08dd18cd11ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 03:45:20.4540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btF1/JryXq+9575qqZqGwFE6bbU/EXmmqgGt+koQ2fV9v/LuGgyIF1CdIGZbBo96+lRl+BwVOUf5teJzwMNdOew3eIfXke4wV0J70xt+9sQn6c2icfqOx6zF3hmSzHYJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6378

Hello Nikita-san,

> From: Nikita Yushchenko, Sent: Sunday, December 8, 2024 6:50 PM
>=20
> This series fixes several glitches found in the rswitch driver.
>=20
> This repost fixes a mistake in the previous post at
<snip URL>

Thank you for your patches!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

>=20
> Nikita Yushchenko (4):
>   net: renesas: rswitch: fix possible early skb release
>   net: renesas: rswitch: fix race window between tx start and complete
>   net: renesas: rswitch: fix leaked pointer on error path
>   net: renesas: rswitch: avoid use-after-put for a device tree node
>=20
>  drivers/net/ethernet/renesas/rswitch.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> ---
> v1:
<snip URL>
>=20
> Changes since v1:
> - changed target tree to net,
> - do not include patches that shall go via net-next,
> - added a new patch that fixes a race.
>=20
> --
> 2.39.5


