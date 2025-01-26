Return-Path: <linux-renesas-soc+bounces-12531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D750A1CDF7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 20:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4AA53A16C8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 19:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7D433062;
	Sun, 26 Jan 2025 19:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B6zu4Fjj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E086346;
	Sun, 26 Jan 2025 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737918162; cv=fail; b=eEfS/82Vuu9nvFuyl+y1QaJhgzrA8aAkDWqIDzTVMwcf8i8PfDDJQbtkw7fi51VS4X2hYnfhuW9mk5xvtnY/k4PDGrC3dBuC9XwkVUwo062qO6DU8nfcDT5y9xMJWkDSqUnrtNGs2bcgEgKYCt0Uy1IFwxm+idj62GjetLwJAzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737918162; c=relaxed/simple;
	bh=70UO3PE4ZdPpn2txzhPigRYo95k6Dm1QmmWYcZusjRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XlKAXT237Vj94l/ZmcGawUtitfwSEtiIaguDNOLdiw6qrjbSS56WmvC37cKD/nJeDvheabkQ1OBMu+Nw2E0YoJJIYOXfCTPMRVjDlQNuTAYmU4+kZiB6LiQ7AbP2vuZdMufcOMOsC3eLTheXARVozo5z4t/FozZPFTgD3Onr01o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B6zu4Fjj; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDeIczER1Z+9haE4yFu2/GH8eI80Axx5zm1+dorFO0Tp6nDmh3SXegb3QPVuDt7b+a7bmPiEv/EZwlV4HDCCCkPLxvNubF2UF5qDAKqc+qhRMStrUuOhQX/b0+wkPRKdGdgyuP5k5YUqVDD/bS/3QK+kI+aMMfdRVjG6aAu8GYFJCgGOme1GJ6wHYm7q5e3mM0qc4f8rRNsHCnjzQATRR2ftIPjzrR7ye3cwBKO2nirTTYdQKSQ/Msko1DNevz4hABCWo6KloCpd/72YTXZfemkf84Ob2YGCll2IswesKujrfvj7vu8qifbb9HWeQ0F+yQW4VyOYccukj6mX2A9RFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhnCdA1h9U7N/F5T7vk6Z1uM8RIiTJ8z5MUxpOzoqfc=;
 b=EEWIrW79RzGg6EN/pxDW9+oGhP9fo07ObimGcXv6ukMkmZlVKyvEiArR9PavyDkfIVO21Z7R0QXISGrLUwWuF4jXNhvjAe7HUyKQ/vaA87DQ8IxBTTMViRUXVYvDYTZ1XEc3n608WixsBmDBtE6pZ6R2GQ7LD/sV1CgoA4sal6GQkdSwk+3gc9MG1sxoxfH4Dwx5eu+wtz+s8DwGtk+EY8CHbv8tgZL0bnaE+tWXXUpNYGblYReO0Q/gxFhm99L4QOEKb7J6nGxdM/9gEhzmKPA04G0iULeNS838xZWsye9FZmpxn0hl8GmgrIOq0YPqhIF3/ZBdV8C6D7eikcG6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhnCdA1h9U7N/F5T7vk6Z1uM8RIiTJ8z5MUxpOzoqfc=;
 b=B6zu4Fjj1ygaOYn4B98UHDBEL0zwzWDuX8lCJowy6V7MFJ4fYvGgDo/L3vEh9zwofbh56eBO70NRp9bZF/9ndf8SCZZcDyrX69Auh0zfFoR8+/CqYFb6wz1fG49yawmn7gPSG6O5qr4EghlnZxSivKLatKsU7lpHbvNiWEAPB9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB12308.jpnprd01.prod.outlook.com (2603:1096:604:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 19:02:38 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 19:02:38 +0000
Date: Sun, 26 Jan 2025 20:02:29 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
Message-ID: <Z5aGxeIqSr7hWvws@tom-desktop>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB12308:EE_
X-MS-Office365-Filtering-Correlation-Id: d7626555-e328-43e2-0fa1-08dd3e3c0010
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JeWA/qPviLm8oZ/KMSC1owB1ApQrzdSwpf/on7XP4myunUEoDJdD7eXt0Aig?=
 =?us-ascii?Q?6KgKh9RqX5FzgQ8pztB6IDiQT+bOErqYsOqcSGQ6rfqukFoyJieT0sRagxg5?=
 =?us-ascii?Q?/WsabfjCgRjIKfkSp2qyUR6FO/7R7iWhAU6dL4YFaXgzF4d8iCMHoxD25zMz?=
 =?us-ascii?Q?y8q/zqdXoWg2pAAxlJ/OCsJygUvErzC+ZyEEaCkXS3w8hS92iKoB5bUjGhAh?=
 =?us-ascii?Q?+BFO91RRpkuKKr6ZvbYqCJc2CDsqR78MXlXQnDaKQZ1zzlfVHIdVdvQCy3MV?=
 =?us-ascii?Q?ZEh17e56eBKvFnpCWBceOzfyNEq7JRjPpFcaOqO2KrD7N9jwxXwRQ7g65qpA?=
 =?us-ascii?Q?v4MY/u8WM/NsGfsj6srSmM1otD28jwEx6mc64VeDBeB2fEtK8FI8Yx/iyWWf?=
 =?us-ascii?Q?VyDA+H5ovdl3GjgzFfqmMA0/Y9lvJR0mO0FS/RLm1AJJzEgbQDc/709W60QX?=
 =?us-ascii?Q?7wXZDR5BGwU7wXiPPhub2Itzo6wZ8hlR6gIsn66o5aXUySARin6CFmUEjK60?=
 =?us-ascii?Q?diUXp1873ayhQxpYYsghWXkAYx1JMSj+mkcDwCAIVDFSxFkJCZIiZS/6Ohhv?=
 =?us-ascii?Q?hGpQyiXTOfpcwgfYcLqtmNF/IBLcjPX1hnLZmBXZry9OF6LZgp/OuU0qtTAA?=
 =?us-ascii?Q?0Tsii4I3HNuHtkaAfcl3Ypo27zQ6txD8HTDfd4anST5DE3Ml8Hj2uhJUjERx?=
 =?us-ascii?Q?h0jMIK5dnS9hNqrpR9mVp5wkq3c5D4AetZmRpKUwYZ6GQWzDcfJL/hRyci1P?=
 =?us-ascii?Q?TgGyDWAPHd08DOZVbQhgdgj8N6pXHR/N4CAmjVjTWvK+W5MYK62tpBiutX80?=
 =?us-ascii?Q?LAwrN2yFI4qVEsmpsCzzyKNtzES8FuSUIU2gaZfUEvHQEyWMlxC0funib2tm?=
 =?us-ascii?Q?aLUJkEOnawImdiV1WZ/YLAlTauD1Xyzh3cjq8n19gcQcnejOnp/4LWK69h9P?=
 =?us-ascii?Q?pQw9dRh3FjJhA4cPLJCEnpldU3gvbCBiltLza+z3D8JYnriQRnEN/B2ACaq8?=
 =?us-ascii?Q?Vhdz/KLpPPDPyq2mcBBWrmIYpojlT+9jAUesFEePuYvQA0x4tG+BPemaUdPg?=
 =?us-ascii?Q?ZS0WH4fcNFlbQFw0Kwr6MPLMBGIxX3pNQPES1tHRF7INfhdnsVjsR1ZSlYGv?=
 =?us-ascii?Q?NJSA7IzJnXNPYACokAVGtHlnzEjWasZpiMqxGLSl7mY+o6aivw9wwADMmBrS?=
 =?us-ascii?Q?9KY6nyqfbLoip8hIhOJMPn51FMOTsaNlcI2plIm/LU9rS3iXbAnB5SRHfT0O?=
 =?us-ascii?Q?rZCprTbTwC+dT2dNSSzbYYIRtiD1j7s1a7XTajTyeHnBvOOMzI0vFErTp1Oj?=
 =?us-ascii?Q?zDL46Tcpq5ZrakVmNM53i+2yP2k39Cx04hlbMd00rVZICtC6Qfg2r0kCHdDi?=
 =?us-ascii?Q?jM5mWsKVnwK19DkK6k2XzCrWHpCmsXjhQahSehm6MNN6SJ0Nb9JxKvQcH3Id?=
 =?us-ascii?Q?6X81HWrBOT73lflqlKZcFbg33bMbQgrt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n1HFaRGJpzxhfiEfCWvpm2fClC2N+2pbdD8b+6Pe0apzhmL7UnjsLKKkUSnv?=
 =?us-ascii?Q?GCwKNm9zoNw5ppNz8Om1ozyUz62s5L3DGxGn/owKTEVBni9XBSPzODMMOupW?=
 =?us-ascii?Q?TqvxMIHKn/0c9Fcqc7sTinfe2Hq21Q/C02l0Qg25QL96xhmJpn/CsjkZRvuj?=
 =?us-ascii?Q?efogBmClOjvqazl+31B2CUrUgdLKx118pPD3F/RJEHMwasflPLO3TBEbYTf5?=
 =?us-ascii?Q?PM5HfOJR4FTYDNM/T4FaWJRX0lHnofT7RZJfbmNERjFuwyn3bx4+RHFMb2Gk?=
 =?us-ascii?Q?7H0at+AohplBuStetp4/He2oIXYOUHmYBV62k2u1KkYi95Zh0eT2XxD0vFcx?=
 =?us-ascii?Q?L65ODW/ixdPvZCzxbK73z2TK2iMGAsjIJv4/6eG5nIPSIMoptd5BAB09U04N?=
 =?us-ascii?Q?RF+4UKchdeYBAQAgIvEdG36+XopecJXP83oK2rbyiU9Mylov+LZabbFDy2+L?=
 =?us-ascii?Q?C91ZiMPuinvJ00O5APlR3XCIJx5WhHKzMOkwbT5gNtjAsWKXUgdXawaTFp31?=
 =?us-ascii?Q?D7F8zVcLXMTOdjn5ZPHiFl6zDNUAmL14H1I2+o1TPoklUEc/669nCcRRsPEe?=
 =?us-ascii?Q?bKrdx6WVzhIQTRS0beVOQ23btJJjZqTY06t/GY0nHmPy+BTLgMcWwlIeAgaa?=
 =?us-ascii?Q?FSVoAJio8menAxPEikpX0u0FghIUFX/jpr2+RcUHtC7+fq3uHHiX6FN2E0Xz?=
 =?us-ascii?Q?xBrQZEZ4DBeKjyqKIuZ8UWt/Tpoq+2nSn3Y9vrfrn8TZ9NrJhuHvWUjdgK22?=
 =?us-ascii?Q?6oPcGsi9VSGvgVpNp6/+JW4dK8f8GHXOGZQXoEd0B7skTDTX+/UWRy2FxWO8?=
 =?us-ascii?Q?t1Bodgfn10c8ad10kUCENJPh9uNuRbGIxz8hpo9s4eA233Q29XcA3fxBZCfw?=
 =?us-ascii?Q?4dF664D0gwXAUPWERVn+jNj7uKVxhfN1Zfm1ubaIbGVwYB4ThiJ8nme1VXA4?=
 =?us-ascii?Q?hCe4/SpWBoWKYdx5/Y76pSlMcyRZV6qHhAdwp5wKcrxnyCYtRXXaSwYU/Tmp?=
 =?us-ascii?Q?3pYKMZyfMn2Q2hTSKLxoiP8KbWWPuD/CxcDMShgVXY7aQpDrQ9o9/76ZV3Sq?=
 =?us-ascii?Q?6iIlqQk2oZP9we46nX2gf9l+cIyEeHz4+T5jTmFyiwv8zzLz6j2eNJAESRAI?=
 =?us-ascii?Q?2Elz+JdjSVMqKxc5AU533jInVQf0BwvIGdMyUM+h/HsKPQhkUh36kxKlYbfE?=
 =?us-ascii?Q?W+6HAfoyJ9Ge8mPefqHyrVonTNMg3JtIl7820xQgQRkc+lK8NT95Eg6QoHWJ?=
 =?us-ascii?Q?m3BhzlJtWJGN/nGAHW1BUwWGqAyU07Na/z9v14OH1Bj8rT2wDtfYyoT42zMJ?=
 =?us-ascii?Q?VdUmf/OMmYfy6SwfjPdPBIO6FxnybMBnQkSev118KAw+eR11EQVJuB0y3Y1G?=
 =?us-ascii?Q?d8LMWxCjze6IsCd6RP4dP42q1MtUw5hHQtdERuJy3cN0BXWq6ZCjqkRjasdn?=
 =?us-ascii?Q?IyhyB5Pa7XaSaAInUg5Z+5GE86uggGByr5mTdUM5kJ14P1jrjNjgHarh5JN9?=
 =?us-ascii?Q?9d0XuL8EkEctv1sTyh9paECQeAaiLKKj2kzqWDmgWQC4WS+utYDIa1GRHpGe?=
 =?us-ascii?Q?fBVPzxFpol5tHpeR9BK26VXuwJOoYeNDlNo92JNUMkGIDeppKe2fF8CAQTdF?=
 =?us-ascii?Q?VJlASXoDiGZW36ekpPH8sZw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7626555-e328-43e2-0fa1-08dd3e3c0010
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 19:02:37.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hQ+s+9VlKwpv1rL5eTtJ0eiGhr3jRXolTti7aK9QGzf9soAuXTG2YOe5n5dyE1T/7DcphDYAeH+g1u4pSNmv8ifwBhweqRjcjQCGyFGsrClC1+ywdRiZvUa6LMF1mzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12308

On Sun, Jan 26, 2025 at 01:46:09PM +0000, Biju Das wrote:
> Enable SDHI1 on the RZ/G3E SMARC EVK platform using gpio regulator for
> voltage switching.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 65 +++++++++++++++++++
>  .../boot/dts/renesas/renesas-smarc2.dtsi      |  9 +++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index c063d47e2952..0e3d4ff31285 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -12,10 +12,40 @@
>  #include "rzg3e-smarc-som.dtsi"
>  #include "renesas-smarc2.dtsi"
>  
> +/*
> + * To enable uSD card on SDIO_USD:
> + *
> + * Switch bank - SW_OPT_MUX-1 (SW_SDIO_M2E):
> + *	0 - SMARC SDIO signal is connected to uSD1
> + *	1 - SMARC SDIO signal is connected to M.2 Key E connector
> + */
> +
>  / {
>  	model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
>  	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
>  		     "renesas,r9a09g047e57", "renesas,r9a09g047";
> +
> +	usd_vdd_3p3v: regulator-usd-vdd-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vqmmc_sdhi1_ext: regulator-vqmmc-sdhi1-ext {
> +		compatible = "regulator-gpio";
> +
> +		regulator-name = "SDHI1 VccQ";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&pinctrl RZG3E_GPIO(1, 5) GPIO_ACTIVE_HIGH>;
> +
> +		gpios-states = <0>;
> +		states = <3300000 0>, <1800000 1>;
> +	};
>  };
>  
>  &pinctrl {
> @@ -23,9 +53,44 @@ scif_pins: scif {
>  		pins = "SCIF_TXD", "SCIF_RXD";
>  		renesas,output-impedance = <1>;
>  	};
> +
> +	sd1-pwr-en {
> +		gpio-hog;
> +		gpios = <RZG3E_GPIO(1, 6) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "sd1_pwr_en";
> +	};
> +
> +	sdhi1_pins: sd1 {
> +		sd1-cd {
> +			pinmux = <RZG3E_PORT_PINMUX(1, 4, 8)>; /* SD1CD */
> +		};
> +
> +		sd1-data {
> +			pinmux = <RZG3E_PORT_PINMUX(G, 2, 1)>, /* SD1DAT0 */
> +				 <RZG3E_PORT_PINMUX(G, 3, 1)>, /* SD1DAT1 */
> +				 <RZG3E_PORT_PINMUX(G, 4, 1)>, /* SD1DAT2 */
> +				 <RZG3E_PORT_PINMUX(G, 5, 1)>; /* SD1DAT3 */
> +		};
> +
> +		sd1-ctrl {
> +			pinmux = <RZG3E_PORT_PINMUX(G, 0, 1)>, /* SD1CLK */
> +				 <RZG3E_PORT_PINMUX(G, 1, 1)>; /* SD1CMD */
> +		};
> +	};
>  };
>  
>  &scif0 {
>  	pinctrl-0 = <&scif_pins>;
>  	pinctrl-names = "default";
>  };
> +
> +&sdhi1 {
> +	pinctrl-0 = <&sdhi1_pins>;
> +	pinctrl-1 = <&sdhi1_pins>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&usd_vdd_3p3v>;
> +	vqmmc-supply = <&vqmmc_sdhi1_ext>;
> +	/delete-node/ vqmmc_regulator;
> +};
> diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> index e378d55e6e9b..ec79452393b0 100644
> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -16,9 +16,18 @@ chosen {
>  
>  	aliases {
>  		serial3 = &scif0;
> +		mmc1 = &sdhi1;
>  	};
>  };
>  
>  &scif0 {
>  	status = "okay";
>  };
> +
> +&sdhi1 {
> +	bus-width = <4>;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +
> +	status = "okay";
> +};
> -- 
> 2.43.0
> 
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

