Return-Path: <linux-renesas-soc+bounces-17231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766D7ABCB2D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 00:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16ED64A5542
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 22:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F09621D59B;
	Mon, 19 May 2025 22:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YYXanLZx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8FDBA3D;
	Mon, 19 May 2025 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695380; cv=fail; b=LLRccgCUxaXpbvzFvXV0CRQEULiNnN56sj2IeTfc0f+5SD/KwXWpaJKm4e8/rH+MStwrnohj13+8i4uG7C9AivDU8StFK4sx0ZRj1M5LYqFy1Z5JlCihxT2R4iqQJx1JiZ3k79uqlWLoYFZXINEbZZBGI/alYdViHXR0vEP7ywc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695380; c=relaxed/simple;
	bh=SC+fgNRyAQ2WTJfr5b9gJ9wjZ+quewvMLK/ZeKT4bCQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=skO1L4IzdWEJ1WUPbQCA2Fui19XaK5sffc87SSBqmlhhtbIPZvRzL5ktgCLYRVawBvV7avWmZJ3lxjdFN3sPNE5Iq7VPQSfQX6xMhWFT9cd9tjwqhQUJEeWMZ89Q8/D9tI4oxsW0kyDcZ/QOgkVvWisokY0BLzK3jACXU/oMhh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YYXanLZx; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTcKP1oABPcZ5b0VS7+3+FcK+0uHXahygoovm9mMtzOu5pGhvFRyXgpqNh+cTtjoV6jADiUBFIEcORMGfvFxTpUG6Vr9jaXlFZqyL1MQYLh9NmG9DNl4iAQOeIl2SYPGxiQEYnH2aoO/kBAcTVQ866Zh82ed+3/WHfua0XSl1zbyW/T2K3/3Dv3wl+KFlsQdVcJWqjURkSB3ISK0dbgMJH2gMriEaIzM7SG7NsyDR4DeeMPTd5p1v5DP2vBy/Al8ixj7wsFN0boifY2C2rDDClNjzUGRY9JOJIu/VZYTQsuqzX+KfCrjcY/oF1kZBMNQmBvJ7JmX0u+QkKuV2uJfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyUt/9pJ6fYCHEFHFApU9LPyEi5l8ZAXF+mFtqBHCds=;
 b=glSdcdGN55CymjY3rV7Bw0HYda8+hL5qDMCSyBvCxCstBGnHw3sz4hgp6/qm2YZpmAMvrkDCtzN40IC4rYOEUzINbuOI+8q2stl1zgQ3RxySZQ06hdm/wrJyQ+qUJf/xBTBcOFxsDoh68OvnOWDAFL68pYqc/benGvUOR0U7Ek+EH4lBI4+2LMFpA3zPvc7DeBf7dK0xbvv66EzHxIYoeyaoHKmwVWOZMIDNxg109x2dFBH1XMJ2yDGatFTdThy2UDAsre05NHvwG6nRepmO1i0j4i5MgscIVL/BtSA8mKd110L/ZSCZGAPHKWvrSVb1KfiMvbQo6VIIQrSd30NNFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyUt/9pJ6fYCHEFHFApU9LPyEi5l8ZAXF+mFtqBHCds=;
 b=YYXanLZxpeOBt3anenTUVSrlYP3D5XnsgefNCSKowmoFNddqVLjTcn7pma95+5Mzcds53AtLz0cKxO4WZakZozTqY0W1Ejb0a891PKuhI6fDi3CbFnj+nbxvSwSMxuSg72Flwg2GZhX7PvpLJGk7pPrml/drNKsaytX20Y84Iho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7018.jpnprd01.prod.outlook.com
 (2603:1096:604:13a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 22:56:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 22:56:05 +0000
Message-ID: <87wmacnrb3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Duy Nguyen <duy.nguyen.rh@renesas.com>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"robh@kernel.org"
	<robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Nguyen Hong Thuan
	<thuan.nguyen-hong@banvien.com.vn>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups
In-Reply-To: <TYCPR01MB8740608B675365215ADB0374B49CA@TYCPR01MB8740.jpnprd01.prod.outlook.com>
References: <TYCPR01MB8740608B675365215ADB0374B49CA@TYCPR01MB8740.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 19 May 2025 22:56:05 +0000
X-ClientProxiedBy: TYWPR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7018:EE_
X-MS-Office365-Filtering-Correlation-Id: b53ca539-aebf-4b69-ebea-08dd97285601
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?RWgTAK75L1SpXx0Lw2AZWI3k0vTLTJCylFRmzcc4wBKE0ZwnNlt4GDVgP5vC?=
 =?us-ascii?Q?hAKjaOYhS17EBgcWWxgkjOF81PtYKLOX0PhKukDrfh4ENZdT7bQbmEMhs0zu?=
 =?us-ascii?Q?b4hcDX8VO4n1NrfuDz4FCk2TA5VZkPh3oSGEc0pIK50T6dbxyIy9qn5V3eZC?=
 =?us-ascii?Q?gx/SowZtKw6esp/eVHJ/5i8/r2bqXp36M9yKMeuT0EG3yaRJaXINxSw9M+jt?=
 =?us-ascii?Q?aW76zgiT6xV2JxuY5SE84sHHKNAEM8nsYthaRhPScQrQXTKsBfyyG9w8X9rP?=
 =?us-ascii?Q?g9BAiF1QlBqSUSWsoO+L7CFffs6zPerqz04e8VQpWalhEnTGHygOcpoAG/xB?=
 =?us-ascii?Q?/HnhcxRIj0gXyjwR3JfZyy73p6/QUaKfCELCwBdTr4Hpcs+pMMSrVaPlgt6G?=
 =?us-ascii?Q?ANtbj3+IMxRTGiyBWswrjZa4lfF3/4uqgJSBhGAVWB0j/Syq1BtL1zuXazQD?=
 =?us-ascii?Q?dNCkB5xEKBvPC/Kc6/XFsDmqDS4IZrFsnX8c2tlicz5ScgPQCrpUP530qjMD?=
 =?us-ascii?Q?JpoBhjzB2zBzuvo3ebih0kMgXTw/+FqVaJbt0Gc34utGxK97ru0ehts9zHw9?=
 =?us-ascii?Q?BAOdfayONZ3l9rCWLeujFHpkDL/w6Pcn9MpdCt0B2cukD0nXnbq0/V6uz1Lo?=
 =?us-ascii?Q?hD8FBpdewI3O45lbW/zvl8nGwX4oM+qtDp4OqZ5WX3kmM8SCVbqCcwghy2zo?=
 =?us-ascii?Q?BlOn64VDwmaQUCKbXyxkB/mPPaRiGdWC29QfppdwQ1J7hQHJIr3e1mUGOEWW?=
 =?us-ascii?Q?h5nLhOoIuJBlFtn79nM2RUx5Xl9pnHmn3ig1Nwq/pN3aRJ1gu6D5ogdSeXeU?=
 =?us-ascii?Q?YGUszE0wwQFJHdECClwaf/wMsaa9VGL/gn0YuO+hW2EAG9ue8GDxs8Wg1fYM?=
 =?us-ascii?Q?wsR1FXNAH4jj979MAe91wWKQ/66mIFNOugsdIjQvtfZR1ThA6y6WGb6YaxQ4?=
 =?us-ascii?Q?xj841PlVhGuYYbr4eDI8JJzgJQWrckX8pLVMj9iFgHChQLel0tvXhPLlwYIC?=
 =?us-ascii?Q?m8qK8tyInAwd2vjeY0F0YMVl1ll7TVzHN4/Q99aZGYgo65GJD+iAeb9yeDAY?=
 =?us-ascii?Q?nsif7Of/rtLaLI2D43mnWZ0DQUgmBK09sGHVW6NkMddkuIVVLbXzYpDFstqt?=
 =?us-ascii?Q?mYhn0RggWxBeYFQh2zJbN5bTui0iqkrXXW2gM/Fq/7VMw4BwozXEmmq8twt9?=
 =?us-ascii?Q?/ToGDNkzl/B/8g9Tigmc+BmEz+bjnnICUZPfDUmazuCkZ89WBjEtrwXPeDR2?=
 =?us-ascii?Q?h/taq/8PfkMMFhCiRmVF5Ine3Afu0CpsgSWaFxx2zu1QmNG/40e+a6+JO62E?=
 =?us-ascii?Q?3wXW2SINPAupOCDTQP1VoRly+GWK26SAGFipvQIm+N01lh372t5nR4C2TV/X?=
 =?us-ascii?Q?hVsLxxBLF4OMxGQMwAoPwRFXBBwFS1vz1NsVXoDbIrBCEcdYN2YrrSXDoZZs?=
 =?us-ascii?Q?rz1mc96g6SdtRNDtIL4eGoxfobRpxs+9PA9FZesfzer96FOJ91J60Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Ci3U8/QIbJPVDUi4QizIP2aVpcAOGFH/Pa1japTpyjBS7eTaB9VzurqcCCaf?=
 =?us-ascii?Q?zw3nrMjx0O3K8CbzHL5TGx2AJflEm0ge4e+VFZkpiYxA5pnDjsCL5r4oLR+S?=
 =?us-ascii?Q?yd5uXm7M5NHSEabofNCi7Q2sL9mtclv0JgMxUYq/Fax2eSXdJd6LWpKnY++K?=
 =?us-ascii?Q?MbcbHCWJgiauCdKwkE6w5rb2Cc/WnLveHvrk9NJAUMmscqu3OQ7DynJdidq9?=
 =?us-ascii?Q?YbcTgsdKM4znArI2bqYSrwnty1jbwJaaFsczaQESRSp/2C7OIUJYIBn2ECNZ?=
 =?us-ascii?Q?UxGjF9noGaOnpEkp1vgLBXfpY7NRbCk6rxnBHfncZLSdlOACtST+ZLZCFG+p?=
 =?us-ascii?Q?LfTsMfTYdrGuX5taWNM3OMejP/cm2ro9YFW23bntS7MTIO6ISdV2UhezpkS8?=
 =?us-ascii?Q?E4SxBNsqwUTFMzh0wEEQqaWL06ojDLQaxS08rR9aoN/XJou0RO0EoTkTSKUb?=
 =?us-ascii?Q?xVdp4u15bwnoei1PnvOq3xPtiXYOiZNQX6y8oGFsY3D24RX42HoEU/QF2QsQ?=
 =?us-ascii?Q?mUIB6IRQzv9f0ZcFXsdMxH0BK5eCfaAeNtbvDe3WsXpIOwK/vjSqo80eyS4D?=
 =?us-ascii?Q?BufJOohKKC/Pb5VHnSl0PDj8YoGbhw2vTP17CHbPURi5mu+8XK/sf6bkx9b0?=
 =?us-ascii?Q?P/mdMVW5Maj9gFb93fjzKy2SlyHdW8wCAXyF+Ui1h3VrOE/Bj7EGrW3v6g+X?=
 =?us-ascii?Q?SCTwod/F3o6qq0O3qEUhEcwd4p/B2U94x221oRiHpshvhu9xMj+7Xb6mSBMi?=
 =?us-ascii?Q?LgNhVJ4gtG/ATjy9ro17dcUIrG+oKH+ZArBIQLgC1WF2F4yJbyhU97Kyrpzy?=
 =?us-ascii?Q?1FDO3nZg8rIskF8R0fp69wNoVb2QaISdLbG5lJ70+UJe+UgiWnXX/DL7qHgn?=
 =?us-ascii?Q?isP/Wsjmto4FX30GKP+12iAkT+YuoaYfvKmKueF9EC5jvu3px3DzYjgYRk0o?=
 =?us-ascii?Q?xqGe4P/fW0Qdkab4xOX5TOBdv4kaPaRFdl5PlhjrTXRe2od4Dvbh288n9cJf?=
 =?us-ascii?Q?0Ozk3FVR0zqVOQsvRy02B9PBv8gVcuAjcKZHcn5KOEjYkkQga6bHTJJcvHEb?=
 =?us-ascii?Q?5d2ZJ7KTKQsOiVDoLwHfJaZl2bvoIEQgqMlNW6rhCopw7C9L1yjI0UvU4IT7?=
 =?us-ascii?Q?Owqgd4eQuodRfFiDZvXOMMHOHg8iL7LRK4FjFS+Q7kCIIZiTwdImtWs8H8NP?=
 =?us-ascii?Q?7fY3ZUOWywfbkGOOWQIamR1VYd82LRtxGlSDGiOn3ORa3dd5WPKc3tdLoWSw?=
 =?us-ascii?Q?W/qR5eFaznKscnR53DUiyRQ66o0BsKJbMWE9iwCJRPSkzgIHFFCaAlAjg/5z?=
 =?us-ascii?Q?i617IFyN1XXvchqeydx19b+rwrlBi2j+YvhUKQ93zDGjxHn5AjnYtR/1oVi9?=
 =?us-ascii?Q?SA7H8huC7jrTIvpZg8hQv9Yolo7FWBm/lids6ZnaiJtKSjwpomDpxbgy8UYf?=
 =?us-ascii?Q?43g5x2kcR4EhCxVAXsZHeeN8gkrgw96ndW3x4NDLX4ArjZuJXqXF7CjL3dxG?=
 =?us-ascii?Q?SXaOWGeSdLiQXU5Lrh26LZzMKb0uFKcoXT8jxJd6Arrd7QzUzjfkH20P/WeF?=
 =?us-ascii?Q?EAuipXfJ0Jw+T2j7HBKuSwafS3wSLEc5xLSVNUqJGiWGM/XPrGxtU1CVPpWF?=
 =?us-ascii?Q?dcdJuW+AXLMjlMhEjTmLD/U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53ca539-aebf-4b69-ebea-08dd97285601
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 22:56:05.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0JP5R0mMq7i1hEkEQKrFSqD3k5tBo6vj2omDGZ0sd6snKlQ0ryf092fewS6laXoAQPSeQwi6pSQnpko1FtlrkTebRO+ZF2eJhE0kDSE4j3rRIBvx/1wOY+mHus0lpOb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7018


Hi

> From: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
> 
> The White Hawk's sound uses a clock from the TPU, but
> commit 3d144ef10a44 ("pinctrl: renesas: r8a779g0: Fix TPU suffixes")
> has renamed tpu_to0_a to tpu_to0_b. We must change accordingly
> otherwise the sound driver will not receive a clock signal.
> 
> Signed-off-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> ---

Thank you for your test !

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

>  arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
> index c27b9b3d4e5f..f2d53e958da1 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
> @@ -108,7 +108,7 @@ sound_clk_pins: sound-clk {
>  	};
>  
>  	tpu0_pins: tpu0 {
> -		groups = "tpu_to0_a";
> +		groups = "tpu_to0_b";
>  		function = "tpu";
>  	};
>  };
> -- 
> 2.34.1




Thank you for your help !!

Best regards
---
Kuninori Morimoto

