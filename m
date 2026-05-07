Return-Path: <linux-renesas-soc+bounces-32210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BdhEgVg/Gm7OwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:48:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4B4E63C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3DED30075F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449553C3438;
	Thu,  7 May 2026 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R+lUA6BJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A463B2FFB;
	Thu,  7 May 2026 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147079; cv=fail; b=sV8/YrrJRH6LPusvKUUpSuVuD1rKMbxwY4UKHG9+dwayMAF/rUOlLDN099dAKoXBCIglZ6tXO3hHtnbYkurCu+jet95IaQFzEHmur6+d6lORK0Hf0pCuhK5W5jcCkOqHxBtNeNNaH8zVKfYxsJ93CgkTTTRXA/+P+cpE6t+1mFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147079; c=relaxed/simple;
	bh=cUEF864ojkbfcmV8qeNPOxLIVFMG1202Sohc/yknBb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fo9nGNwjKisVQKAy8ni1pN/S6ELLYwTZXIafsPcWFlpt/yzxnHEIUwvdkeW7CccyEcnlbjs/vrDEICfWNI/llZKNrEjaSoy/1bfWLN6B3XXdvSePsSui5UcgHHtf1JUMZWMU8S+6jNSIgxg/LzQzu4GkzbJPThR1apwAckCCGA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R+lUA6BJ; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU4urtMSZ+gDPSPTLFL9bhvvB5k1tVY6gnOHVwPyJO4jARwh4wKmytPJfWsde0MUzAcvfDzNvrHNjJIbr8evmZnM8ivKqI6T4tCDQuy79WinWzerfcsJ0CVi2T6rj28iZfyJP+EeQNxDLURy+yLOe2sEFsDi294gfabsEWfDapiFiKY+J5yZ0wJEjRSB3vf3R+31A6H4gv544BrGxT8F72STzCnnnpbzap6BcDzbDFdeF+licTnBIo73uj9uLwuLYRsv9qQs08TE2iIdHJ4EapMYMta8hCa4fO2oWqly/M2n3WcHaLLeU8Q12xwJq1bcSPMWiQ6+nacyfeJAI6B6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyvfRMe1pSNC3V3iWnvMDXgv/+MxAcKGoi6IPCTNDec=;
 b=flyTPIpdpTA+fvekhj3YJSnLUZlxPj8goJyGG4A7Rj8cqqSCAF79AVZPTBfQJMtf6NLzQDRM7vSCOdAtt1xFUnr0NSfHKD4Af6UIZLho5A9hbEXlUpyi9Rpj22bCdGiuidXZ4y5lYLeAobdTyD0/Y4WMq/1LtpRx1F+uJ+uPUrZ6OXF8dtRdUKaDzKnZGm1JYli20J4TASz1TzIuxTpl03+I8g7m2an8kRldzNMmXIbBfQRLu4Jnw1ja4q43P0JvaXxac0v9LhuWxaxaSNTUQwMr3TFVz43plQhJKuuAV5UIVinEsxFat39b2QZl3c/T0tl5PNh4V+aMQAwQewfBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyvfRMe1pSNC3V3iWnvMDXgv/+MxAcKGoi6IPCTNDec=;
 b=R+lUA6BJLbabXnSESDGS6pwwUPhZ9guB3X00fFmh/AWYs71jB/zRNHaiEqgYGod+LKXrqOIvxOvpEh3/YmnW14VpB6QE07kSJy9L8g8R2lQ6rgDpHAs5L823GuEiube63tPhq3CDTcQBAHxeYkbjyb7Tw6sgqnBJbXIHdZLxrus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15143.jpnprd01.prod.outlook.com (2603:1096:604:36d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:44:33 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:44:33 +0000
Date: Thu, 7 May 2026 11:44:16 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Ulf Hansson <ulfh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Josua Mayer <josua@solid-run.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
Message-ID: <afxe8Ki_4fpcahFc@tom-desktop>
References: <cover.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
 <582eb5408684786577e5fa85b80f585c8739be15.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <582eb5408684786577e5fa85b80f585c8739be15.1777294876.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::7) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB15143:EE_
X-MS-Office365-Filtering-Correlation-Id: 3baa26a7-c6db-4c70-6900-08deac1d3e04
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|18002099003|56012099003|38350700014|22082099003;
X-Microsoft-Antispam-Message-Info:
	nnS7s4Etld2jkm1XOV+6txCdV3XXvYvtduDz5QBiMgw1P95PMOeGa4YFmAPQ0LfGudW2ChYRkYtrVhr2F2INRPXg1iWObBn0WU49VhbASu0Ik5vlUeeJ593XDRmeOgQPQ3aFLgFHdR5D5a1pBvApQgpwsip8VmikDtBM8nUphVT8PB27Om5Z06QtF0UqAzSFPMCqHBZiJDOMzi4tKg8jlF1RcX9R0k9gCrg7BLcg9aFI8IlXOOUBlxq/ptLjEBfKP51QaJF5KDZOiaaTSU0Pb2O+Ioy4PHzRZFa03hV1pqZrGSFtVkdMHhRrJ96IrkR/qxpSNF4wisG/Vn8vJ1AKyAEJvTtroRMTkHW/19A1yFy7IP0QO6WkuxMjnHmhystr63svj62JJ1gW5VqwkS8URtnxhwAnNhg8VOUZU0AXUqJVTvcsy7D9LLuZ6GgDxto82SHygsu7H62v+VWRPQ99sEauzNAh2yh7/nMHiPNv3RpxdyVaq2VrkzcnwQ7z8CVuTUjrMCzev3BxgS5v2FFaboQSFUq9klHEx3yWCndl3Biu5lF/vCBL59Fm0gRoQ3SNX1tV8b6sjPLkBfoIILuWpfNZR0nKOm36D/Jebwq3YRPSm5hjGj6nYkgkx83Sppe3EtJtyg/3aJI8VPfJNCcZSTzJAWHw/0Le5TdZDI58O94Bz7uDC5XKZQ2fol3YSLxCjQRAgveirc7Q6X1qw5kr6qo2H4eSDEMAJ6PDnXON8XmQrUYLaLbtCPbaSh0g9dts
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(18002099003)(56012099003)(38350700014)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7GLwJZLN1EJGZRcYQUJ8bYM5Amp3Jqqtmjgth7cZVstckkJZmUHLnzfV/Ijp?=
 =?us-ascii?Q?5hZ1PC2PXCHCyjjn1De4ihK8K3eLONLcYEoWmmE9Pa7Mi/UdfR4O7BxCJCeS?=
 =?us-ascii?Q?3gAtVZIfhpxtWL9syfPXHPycMDCoFK26mTd/VJsTqOi7gUfYoelAQ9tCklHj?=
 =?us-ascii?Q?GpkHVifTIg35sOVX2a2hJOqOYTTGXFdNyP/gbdfcNpKbl7A8OlGV3XkJGIi9?=
 =?us-ascii?Q?S6Wo01VCIhVpScCBQ3YCYryfsqY00bZl8buV5TLc7pK7K/TqtyHWBDeq81+j?=
 =?us-ascii?Q?jEwgUSkkmVZ3itYjJHbQ8xCnCLpbqPTDkxLODAc5U9h0Q6S0wm/uMvynVzHK?=
 =?us-ascii?Q?e/HCXWJ6t/EuRI7R5pjUWfvglRZrn9taf/L30APGDiks5Bcnz2LI9e+xNVfr?=
 =?us-ascii?Q?aL7ket17kgSVI6AtrdsaByGmwgNPgfj/Ho9V5KDZ9AKXB9dpoTma79aPT+Bi?=
 =?us-ascii?Q?0mbj28309H6K8se2gTg0j9MGXhtjdYD7qQ9uX48mCLYqINrlM8u9Op69Q9y/?=
 =?us-ascii?Q?UV4SFwWv/2TGsZwMOLAgnr8fEJN2tuvoDim89qeGQx0MMDhPw3UbygBdM3Mi?=
 =?us-ascii?Q?6WiKVXUh1q/RyYFJbbyzL6LXfegJgF4OgT6YHozH/KAzB3v2q+UUVgNp/3YY?=
 =?us-ascii?Q?4ehSl317NEIXxtzlAKtYNiVZ/kS29ZddA4bnohnzoKulPQr6rqQ99lL5R0/H?=
 =?us-ascii?Q?LMHKDgoilhztMFrPt/wgU1opTi1w6aRohIZRldT8mhou0I4lFK9bF/oP1iDB?=
 =?us-ascii?Q?6PapEA69tf1DLFuCdbiytetaGpmoTxtCRUP2DVumjD71PW+XFtIr3iHhUadO?=
 =?us-ascii?Q?K7ckcQm99Ap8+8IO+KYFbCn9qXkHNBb8U56v9EEo/fE5K7AJkp5n9vNyuoRO?=
 =?us-ascii?Q?99OjawaSml9LyOpBg0gKr8VV28ZTKqmFXQJdLs3PrmffprDrmX8lP/+uEpi8?=
 =?us-ascii?Q?2jZCBAAePX40m5j0cyYxKEzP3aLdBm40uNJMtjo53nB8YHvMiBK4DEqJMwoY?=
 =?us-ascii?Q?QOF9c2DBXZzpXQOKiKB5ckJ7Ci+X1MDLFfkCBCD6pcuD/IrrlFLn9c9sbeBT?=
 =?us-ascii?Q?oWz+4fhQj1h8Rizbeb2D4rtwPpzApKLv9HsndQ7aZnbMcHR7kGyO6qEzH0RU?=
 =?us-ascii?Q?H204T5W8i6E6BmhgZJlzptBV6cAkKA1ul5h9d6Bua6yTuQ5DMcYYiQDuPUwn?=
 =?us-ascii?Q?ht17ieaN/T5VqdVtod0tdEcfhmHr3brcCaJpu3UlbY6cXdtcvfIo+mzEjPt6?=
 =?us-ascii?Q?aZULMUi/772kEXgp4Oo6GA847zqz/Z2XCcHbcUg7tkl+vqbeGmnH8IoC8Z59?=
 =?us-ascii?Q?ibMIHpQwYsDLAqE5xTeaFM3wO+1H2+90WbaGusZdm/XkMtRLbIJJw1qCGqWE?=
 =?us-ascii?Q?MdY0/DndEbkSFjiHgLCv7h+aQ7sRTtLZrJKJgNbLNl+rcSnSmOuZAVfWMWUc?=
 =?us-ascii?Q?UEIwdmFY9dzpLe6zX0z29g1PTqn6z+z6H2SuZdotORHDg9k3T97u9xHofF8x?=
 =?us-ascii?Q?UKiQ+jRxGDwpDm8s/B6MWi80hThepcOtIODpkWNjFrj8HBq9BOQcaMHahJUd?=
 =?us-ascii?Q?4x4MyrWcX9M8r+iqrOxvxOy6YFiSJRHPyG89hA4NR1+S3nNVg55hWr9QmtiR?=
 =?us-ascii?Q?YP2AUFJ3ezqxSRGFQI8fhlXV8ue8LYbom+LIHgvT3uYGdOf1kGUXj3O+UCKi?=
 =?us-ascii?Q?JZZMMnmCSk5QOdlhgxx+xn9X4opTp+4soclXHBKrik56QOD4ehsljhYKCkm6?=
 =?us-ascii?Q?GYZIDnmBS0ssqkstInd1XtumEEVrPIl+UE7gfh8xat4IiA+bTRqH?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baa26a7-c6db-4c70-6900-08deac1d3e04
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:44:32.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJEZbM4mHwlXru4e88PrwACe/pAyToy8j1Avs0Ng/YRyHi+1LFPl8n2Tp8G3iJsX0N5y1nsmFKzKjIKElWZ0KG1/SiaQJa+kv6PUyiJYu4tS7nhXXTuJNM19p6uoFQD8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15143
X-Rspamd-Queue-Id: A1F4B4E63C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32210-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,pengutronix.de:email,renesas.com:email]
X-Rspamd-Action: no action

Hi All,

On Mon, Apr 27, 2026 at 03:03:37PM +0200, Tommaso Merciai wrote:
> As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
> bit of the VBENCTL Control Register. This register is mapped in the
> reset framework. The reset driver expose this register as mux-controller
> and instantiates this driver. The consumer will use the mux API to
> control the VBUS_SEL bit.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Gentle ping.

Kind Regards,
Tommaso

> ---
> v10->v11:
>  - No changes.
> 
> v9->v10:
>  - No changes.
> 
> v8->v9:
>  - Fixed driver comment year (2025 -> 2026)
>  - Switch from devm_regmap_init_mmio() to dev_get_regmap().
>  - Drop unnecessasry include bitops.h, of.h, property.h and
>    drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
>  - Collected PZabel tag.
> 
> v7->v8:
>  - No changes.
> 
> v6->v7:
>  - No changes.
> 
> v5->v6:
>  - No changes.
> 
> v4->v5:
>  - Changed file name to rzv2h-usb-vbenctl.c and Fixed
>    Makefile, Kconfig, function names accordingly.
>  - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
>  - Updated commit msg.
> 
> v3->v4:
>  - Removed mux_chip->dev.of_node not needed.
> 
> v2->v3:
>  - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
>    is an internal node.
>  - Fixed auxiliary_device_id name.
>  - Get rdev using from platform_data.
>  - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
>    as it is needed.
>  - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.
> 
> v1->v2:
>  - New patch
> 
>  drivers/mux/Kconfig             | 11 +++++
>  drivers/mux/Makefile            |  2 +
>  drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
> 
> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> index 6d17dfa25dad..7f334540c189 100644
> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -70,6 +70,17 @@ config MUX_MMIO
>  	  To compile the driver as a module, choose M here: the module will
>  	  be called mux-mmio.
>  
> +config MUX_RZV2H_USB_VBENCTL
> +	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
> +	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
> +	depends on OF
> +	select REGMAP
> +	select AUXILIARY_BUS
> +	default RESET_RZV2H_USB2PHY
> +	help
> +	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
> +	  RZ/V2H SoCs.
> +
>  endmenu
>  
>  endif # MULTIPLEXER
> diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> index 6e9fa47daf56..3bd9b3846835 100644
> --- a/drivers/mux/Makefile
> +++ b/drivers/mux/Makefile
> @@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
>  mux-adgs1408-objs		:= adgs1408.o
>  mux-gpio-objs			:= gpio.o
>  mux-mmio-objs			:= mmio.o
> +mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
>  
>  obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
>  obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
>  obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
>  obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
>  obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> +obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
> diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
> new file mode 100644
> index 000000000000..79197fddbf74
> --- /dev/null
> +++ b/drivers/mux/rzv2h-usb-vbenctl.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/mux/driver.h>
> +#include <linux/regmap.h>
> +
> +#define RZV2H_VBENCTL		0xf0c
> +
> +struct mux_rzv2h_usb_vbenctl_priv {
> +	struct regmap_field *field;
> +};
> +
> +static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
> +{
> +	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
> +
> +	return regmap_field_write(priv->field, state);
> +}
> +
> +static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
> +	.set = mux_rzv2h_usb_vbenctl_set,
> +};
> +
> +static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
> +				       const struct auxiliary_device_id *id)
> +{
> +	struct mux_rzv2h_usb_vbenctl_priv *priv;
> +	struct device *dev = &adev->dev;
> +	struct mux_chip *mux_chip;
> +	struct regmap *regmap;
> +	struct reg_field reg_field = {
> +		.reg = RZV2H_VBENCTL,
> +		.lsb = 0,
> +		.msb = 0,
> +	};
> +	int ret;
> +
> +	regmap = dev_get_regmap(adev->dev.parent, NULL);
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
> +	if (IS_ERR(mux_chip))
> +		return PTR_ERR(mux_chip);
> +
> +	priv = mux_chip_priv(mux_chip);
> +
> +	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
> +	if (IS_ERR(priv->field))
> +		return PTR_ERR(priv->field);
> +
> +	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
> +	mux_chip->mux[0].states = 2;
> +	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
> +
> +	ret = devm_mux_chip_register(dev, mux_chip);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
> +
> +	return 0;
> +}
> +
> +static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
> +	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
> +
> +static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
> +	.name		= "vbenctl",
> +	.probe		= mux_rzv2h_usb_vbenctl_probe,
> +	.id_table	= mux_rzv2h_usb_vbenctl_ids,
> +};
> +module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
> +
> +MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
> +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.54.0
> 

