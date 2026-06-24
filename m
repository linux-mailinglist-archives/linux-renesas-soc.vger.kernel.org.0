Return-Path: <linux-renesas-soc+bounces-34403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8AvwLAz8O2oIhggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 17:47:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3666BFC4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 17:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=bX4bYQm5;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E9C5305762D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F1C3CC7EA;
	Wed, 24 Jun 2026 15:46:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF71AAE17;
	Wed, 24 Jun 2026 15:46:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782315963; cv=fail; b=mDOpeK25IgpcERycHGn594cqCfVl/uw7tj4uxhqd1PvHDGdTAv9oHsnnc7TX2OmHUz7XNfJmGCLVfK7W3waBOgCCUBsnFmpGSTKJl5twQDIvmKXXHzEwLYqnXVQ9HEsWm7E0bMmi6dGYyZoJuoQyBs014PSvkGEaMzbm0t6Q+HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782315963; c=relaxed/simple;
	bh=TtuLF4q26lDGzQeC9ZxFxVvpV5gLaJfPKKOchrShGek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=noybf9Y1eDuoRTcxdMuE3b2aISqyoJC4HKiXAz5rgpBDyPL7S6AvW8I3B16SvNW+fzyW8EiU1NGJbqGf6i/CZ+2ol2BNBCzwwHm2S9eRty4TDXAspZJycppbE1QvLLe3UDXdpc+m7mi4dFY2ZxU7Dcb0un+OZL1GIMYxtkiIsU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bX4bYQm5; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/uBdawEJiNqBGQZFm8YRMqrABVj+1M49XQV6jKWXOcIyQ+jp0VvRVRndNiS9apXMiZ2zTOJTtoAsR9l2txT9/g8JXfsPhJLTdUOLiA8DUyLiE/lAKgX9ilJGgL39ZI5Va5xlU3QbavVvCLi3CFbPAXr5TxtL0JS2ofqbS6IjyjNrMDhWCuBgcCWEqpvC4UaHlskBOJksS4c78Eoedo6nc834lWzNHDgE6ZQdKGJM2BXFtvOjstc2Q6rW0tyofrX2g1za72ZTQBbRI3Tl0uJBLnaI+qmxuNeEnrpPeo2GkzuLNSZKHX2Uv2i1t3oTlZBlbNdU2wcXrqFTsfrEhFuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74/pUqZNjJBYhzVacn142Fsj6HwhFi89WfAdL2x45Mo=;
 b=hiKDjxFYXXET3+Oc3IikBsk5cXVTEBV1Ov6YnOx2buY9OoEyNkqzgfW7Po8i4IV7jKnMMAtvvseUEVHOQCq6Wr3Rhsrq9EiAS8fuP4d+5D9vsk2TB7VuNSbIjhvIRaqedKILhUEvEB6uVYG7BJCKwmpjjjLZpLVZnuLWaCt8Pa4O5mYZvVHV2p+rnbQF1ni45nLONCn7OA5h6JjpuAsg/Xb3i3FD1iWuqoxyQXE9HSZxEhn1pdo6J7BDLrUbC25X0QtCRE2gsGy8qEjA5H+9vOoQrA+l0SejbZKb+RpMrLgGHJ4f/g82dqsVzox2/xD6sKaDSWdat5PNBYxz6kSHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74/pUqZNjJBYhzVacn142Fsj6HwhFi89WfAdL2x45Mo=;
 b=bX4bYQm5iaHxUAQU4xJ5CY+OLvH7Q2HrqnRo5WCJM5uc5+dCulaT7IbL1zwRYuc3Ocjvzs+ZMq0ajOdCNfGm8ocZ5MqXyzh/dhTzq8UTGT5CW9f7vIUMREgQDHhAX28a3cxaJFzkPnMSDI7zpaMvPhusyNPnm3POqtN5ToWwMaU=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB17249.jpnprd01.prod.outlook.com (2603:1096:604:410::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 15:45:58 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 15:45:58 +0000
Date: Wed, 24 Jun 2026 17:45:40 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 2/2] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Message-ID: <ajv7pNFcybIziD95@tom-desktop>
References: <20260619101026.323633-1-biju.das.jz@bp.renesas.com>
 <20260619101026.323633-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619101026.323633-3-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: VI1P189CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::24) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB17249:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c1c746-0b48-4d71-c696-08ded207af79
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|7416014|376014|1800799024|366016|38350700014|18002099003|22082099003|56012099006|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yWwxHsMx7FrlW4kAe7Z/CLxu43seQk7BuUuaHFYFrDXlooR71Il5MZEzdRtr9JiDbvi9a3v7essj8Ra9gaQv9odZLlc50U4BfHyAARzX5kZ23LTy2FyQEqVzIY9jMFE5QYVcrZc7n2hsrMOLmur7+vcuPk/hzreqNYmN0U3PQBVgVskVWse90Xsph5C3Mn3mNnWUeFqIgR1PKFKr2CmScjMXFeQHWbkggQqiRrvQSO077+3/EU3ajpsddtmqmHlWh4yEX4OP6Qz/R1UeE2ZjKHkCMeOSy3p51qiTrHRdcQFQt0fXf8AwIiIk9kFy7Yvh16nYP6t3sRy+1t6QqbeqoJ3MvNvl4H7hRHcbDNzlSzY9CBM0f1sBOQwhxgOczmhwUKdsu0+OJOZBtRFJBvM4MELSY5Jc2MFq/t8fNADNBVSKqB+aVhw6ZVzUKKyitk9gPn8RzOy1as20EZwi9QlZ3gSBwhJxxSp/c1iMdJ9TRWXZGFPJQQKvshnsNwDeWxr7xSUsIK932URr52GEocYsP3BDPyyyxzcaPzrbDIdJyay+Sl/ImYjX3dg2jaCH/7GQoz2CbTWBB+lgVy7xIRY/bknp2h6uD1w6uhcuU5xfrmTv6bVmrxAbgBFod+Zw9DP1E4g0RXUtDqaZK3gbu+0luDL2wVeuZrwo6R+pFDVosdGp44Y2nqqTihsdEyF+JAN3KxiC19EUV2Kw+jdq+VZW2U73ZUbtNIU4z1CW0k5Y6vo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(7416014)(376014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j6NJ7IEgEQrbGSA4Jvr8ydNa8nPDkrK9R9a+7IbSB0LJL3bsRlOGlkVtlLu1?=
 =?us-ascii?Q?GJ+mt/9+ue5kNJZ1rrYwmVfs3Zwrxua6QDRKjF3ZZShcIL1+TifXACFaoWFJ?=
 =?us-ascii?Q?I6t6jJ0lbIOPaUgkdLyvPbLKljFn2WyUhmrcqCY2Ju1Yn2q0d9YKZMSU3aKE?=
 =?us-ascii?Q?ihqsFNEgslfCnCG8G5wt/+6h7nO8kaTkXBtmIlwJzUZY2HBpYDT8owfHjWaO?=
 =?us-ascii?Q?tnxlq013bfcr1DWvCj7B2CUu16/sPUag9Nx/JrU1nhjFlev02dKQA7I9eykz?=
 =?us-ascii?Q?s8YCwlsAOHndDC3CTswfheILzj37+UvY/HsngjTd7bROCTTs7qfXZo3BeAeY?=
 =?us-ascii?Q?PdD+RuO/cF3rWEiTrYZlf/VKySbInOllKFFuWJOOLiMyEZRsyX3vZrxpGrRv?=
 =?us-ascii?Q?wGzKWTyVq+QHoLZzNq2+imF7kp0YVmHwT/eaHZqOTQtcbsy+kcKebaiumyip?=
 =?us-ascii?Q?zQSfsXHwBNECN0zwm6BlG41zyjMlkDfMjLY5j2ZdBrRdxc1Fa5eA+mEGVRgj?=
 =?us-ascii?Q?G9RxMkWYzVP19kwJkIKxdoDYe6zq0lvvvG9yF22xFCwXaITIOfJ6zwH1+edP?=
 =?us-ascii?Q?JgH5RsOGR5WPs7HEZudVfmVcXInsmZZHK93I/+i+/N4DpyDrK6O/05BFjaqN?=
 =?us-ascii?Q?k7uAxyD2DKvrBERk5A+tQ2FOoHp4Kk6XUwXe8bP45QR9F8osTnVJ2s47pIjB?=
 =?us-ascii?Q?H+KMDTOt9mlyxtiY7jr3WQPGsfOk/6EaZ2XLVcu5JZ+QMMMt3vU548VOtiHe?=
 =?us-ascii?Q?/662ti7bmN0y/mQMb98Ug8xD1WNf5wB323bYInekgD4ZkuM36u5w92NUvFHX?=
 =?us-ascii?Q?00W9P7iiLviQ59RDQAqVemyOOxUl7kQppA7DMQRb7V3ylFjkPE6WDHrU03bb?=
 =?us-ascii?Q?sHkEDGOVy58IXUdRYZaxA15BKC6iyIONm023l1dLbZJ36e3BCgvm6xqfadwt?=
 =?us-ascii?Q?9pa59Bky+YE9bZjlkQpaikcx+5Y/yYxMP7/Czk9Bg9U1CrypClC4isnX53KK?=
 =?us-ascii?Q?BGyOKRVDgxqG2pNZiSYKqmrG1N9XcNyOihXicx+3VT5I11r0qMp7FZeIXLCh?=
 =?us-ascii?Q?Exf4OApzwbsbBluhxyeV6NSO8V6H8+WzmSwc7ZTA4ij2wQCg+xm/EKlWFKJr?=
 =?us-ascii?Q?uCnCxNSPwUBB6u5UBZzYwxCGtbOHf9SpFJoPA55Ew8G/VM3uweGSvky4e8lY?=
 =?us-ascii?Q?gDFuN36z5DXXgKhPn79fD7OkTGjKckAFnMNio8JVRxzy3NUWePV8J/nG3l8n?=
 =?us-ascii?Q?UcIgMTThz8B7rWls+Wn8p7gTwPtGuyAW/+A89y90wfVDZFPnWY7FjBhKjzax?=
 =?us-ascii?Q?8KYv6Z94qaBdey2bHC5TtVHyHHX6l+RCW+tn38sBCT6aYUAK5QKsBY3CXYi2?=
 =?us-ascii?Q?FeOS3kQ2qgQoSgHQxu7nta+Gf2ngiu5MlRlQOaMbizlkkxpstTgiVxdNqKol?=
 =?us-ascii?Q?0SCOT0DZKhSMZfNBZ6JCNZvWcKZG7APDgU7dK/5MIG3+sTggqc44sotWne8v?=
 =?us-ascii?Q?wvakVZGFPQMH9eseUsUOtbxg4NFMwi4H3wNGWo6IadjhWw4kjpVnzkTPOUlr?=
 =?us-ascii?Q?8dAwwCYQ+MepuGrMaxs9sk/Ejsc06uox4Yn3E/cIwdBv69nUixITbNOIALJ9?=
 =?us-ascii?Q?FUPPSRQTumXB13RIpZr8lIVyl22O/+b+GlGvCNUS3XMkvxUdYSvnM4DFwG4G?=
 =?us-ascii?Q?dA+whG1SEkDFIuuyURpcrHceAMfBxJXR+1bEKWWim8InF0HphKI0DHocNXD1?=
 =?us-ascii?Q?rLAk7UUsIooHjj3klcI3wIo+Aygb9/Zx0aDLiW0bbRClSOH1udwl?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c1c746-0b48-4d71-c696-08ded207af79
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 15:45:58.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJc/P8m7I55hwM25xlqUzs3JqlKP5kzhJoho2PcWwnVtk1zqvb8QeZquMJSKoFpvDewqndah6Xa5Dpivr24Gy6QqxUIibwgmjH0CX0lTAxNsb6yBwc26uiA1TOYw1vhu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17249
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34403-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D3666BFC4B

On Fri, Jun 19, 2026 at 11:10:17AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
> mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
> from 25 to 87 MHz. The LVDS module cannot be used at the same time as
> MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
> the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
> MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
> module.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped the header files clk.h and syscon.h
>  * Dropped next_bridge check in attach().
>  * Dropped syscon for getting regmap.
>  * Replaced the below macros to match with hardware manual:
> 	LVDS_0_CTL_FMT_SEL_MSK->LVDS_0_CTL_FMT_SEL0_MSK
> 	LVDS_0_PHY_CH_IO_EN_MSK->LVDS_0_PHY_CH_IO_EN0_MSK
> 	Replaced LVDS_0_PHY_CH_IO_EN->LVDS_0_PHY_CH_IO_EN0
>  * Replaced atomic_reset()->atomic_create_state()
>  * Dropped the tags as there are new changes.
> v2->v3:
>  * Collected tags.
> v2->v2[1]:
>  * Replace drm_atomic_state with drm_atomic_commit in
>    rzg3l_lvds_atomic_{en,dis}able().
>  * Drop local variable ret and dev_err() messages in
>    rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
>    capture unexpected failures since atomic_enable should not fail.
>  * Drop local variable next_bridge from rzg3l_lvds_probe().
> [1] https://lore.kernel.org/all/20260524194457.479681-3-biju.das.jz@bp.renesas.com/
> v1->v2:
>  * Dropped unused function rzg3l_lvds_is_connected() and removed the 
>    corresponding header file rzg3l_lvds.h
>  * Dropped next_bridge from struct rzg3l_lvds instead using bridge's
>    next_bridge.
>  * Replaced pm_runtime_resume_and_get()->pm_runtime_get_sync() as
>    atomic_enable doesn't fail and for each enable there always will be an
>    atomic_disable() call.
>  * Started using DEFINE_RUNTIME_DEV_PM_OPS for PM callback.
>  * Replaced rzg3l_lvds_parse_dt() with devm_drm_of_get_bridge() in probe()
>  * Started using reset_control_bulk_*() in rzg3l_lvds_pm_runtime_{suspend,
>    resume}()
> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
>  drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
>  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 285 ++++++++++++++++++
>  .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
>  4 files changed, 325 insertions(+)
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 7f2ef7137ae5..1e5b3dd1c0de 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
>  	def_tristate DRM_RZG2L_DU
>  	depends on DRM_RZG2L_USE_MIPI_DSI
>  	select DRM_MIPI_DSI
> +
> +config DRM_RZG3L_USE_LVDS
> +	bool "RZ/G3L DU LVDS Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	default DRM_RZG2L_DU
> +	help
> +	  Enable support for the RZ/G3L Display Unit embedded LVDS encoder.
> +
> +config DRM_RZG3L_LVDS
> +	def_tristate DRM_RZG2L_DU
> +	depends on DRM_RZG3L_USE_LVDS
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL
> diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
> index 2987900ea6b6..46decb7ac4f1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> @@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
>  obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
>  
>  obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
> +obj-$(CONFIG_DRM_RZG3L_LVDS)		+= rzg3l_lvds.o
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> new file mode 100644
> index 000000000000..6100888ea728
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3L LVDS Encoder Driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "rzg3l_lvds_regs.h"
> +
> +enum rzg3l_lvds_mode {
> +	RZG3L_LVDS_MODE_JEIDA = 0,
> +	RZG3L_LVDS_MODE_JEIDA_MIRROR = 1,
> +	RZG3L_LVDS_MODE_MODE2 = 2,
> +	RZG3L_LVDS_MODE_MODE2_MIRROR = 3,
> +	RZG3L_LVDS_MODE_VESA = 4,
> +	RZG3L_LVDS_MODE_VESA_MIRROR = 5,
> +	RZG3L_LVDS_MODE_MODE6 = 6,
> +	RZG3L_LVDS_MODE_MODE6_MIRROR = 7,
> +};
> +
> +struct rzg3l_lvds {
> +	struct device *dev;
> +	struct reset_control *prstc;
> +	struct reset_control *lvd_rstc;
> +	struct regmap *regmap;
> +	struct drm_bridge bridge;
> +};
> +
> +#define bridge_to_rzg3l_lvds(b) \
> +	container_of(b, struct rzg3l_lvds, bridge)
> +
> +static const struct regmap_config rzg3l_lvds_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = LVDS_0_CTL_OFFSET,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Bridge
> + */
> +
> +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_atomic_commit *state)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	u32 fmt;
> +
> +	/* Get the LVDS format from the bridge state. */
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	if (WARN_ON(!bridge_state))
> +		return;
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		fmt = RZG3L_LVDS_MODE_JEIDA;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		fmt = RZG3L_LVDS_MODE_VESA;
> +		break;
> +	default:
> +		fmt = RZG3L_LVDS_MODE_VESA;
> +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> +			 bridge_state->output_bus_cfg.format);
> +		break;
> +	}
> +
> +	if (WARN_ON(pm_runtime_get_sync(lvds->dev) < 0))
> +		return;
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
> +	fsleep(20);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
> +	fsleep(10);
> +
> +	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
> +	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
> +			   LVDS_0_CTL_FMT_SEL0_MSK,
> +			   FIELD_PREP(LVDS_0_CTL_FMT_SEL0_MSK, fmt));
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN0_MSK, LVDS_0_PHY_CH_IO_EN0);
> +	regmap_write(lvds->regmap, LVDS_CMN,
> +		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
> +	fsleep(100);
> +}
> +
> +static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_atomic_commit *state)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN0_MSK, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, 0);
> +
> +	pm_runtime_put(lvds->dev);
> +}
> +
> +static int rzg3l_lvds_attach(struct drm_bridge *bridge,
> +			     struct drm_encoder *encoder,
> +			     enum drm_bridge_attach_flags flags)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	return drm_bridge_attach(encoder, lvds->bridge.next_bridge, bridge, flags);
> +}
> +
> +static enum drm_mode_status
> +rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
> +			     const struct drm_display_info *info,
> +			     const struct drm_display_mode *mode)
> +{
> +	if (mode->clock > 87000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops = {
> +	.attach = rzg3l_lvds_attach,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> +	.atomic_enable = rzg3l_lvds_atomic_enable,
> +	.atomic_disable = rzg3l_lvds_atomic_disable,
> +	.mode_valid = rzg3l_lvds_bridge_mode_valid,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Power Management
> + */
> +
> +static int rzg3l_lvds_pm_runtime_suspend(struct device *dev)
> +{
> +	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = lvds->lvd_rstc },
> +		{ .rstc = lvds->prstc },
> +	};
> +
> +	return reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
> +}
> +
> +static int rzg3l_lvds_pm_runtime_resume(struct device *dev)
> +{
> +	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = lvds->lvd_rstc },
> +		{ .rstc = lvds->prstc },
> +	};
> +
> +	return reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(rzg3l_lvds_pm_ops,
> +				 rzg3l_lvds_pm_runtime_suspend,
> +				 rzg3l_lvds_pm_runtime_resume, NULL);
> +
> +/* -----------------------------------------------------------------------------
> + * Probe & Remove
> + */
> +
> +static int rzg3l_lvds_probe(struct platform_device *pdev)
> +{
> +	struct reset_control *rstc, *arstc;
> +	struct device *dev = &pdev->dev;
> +	struct rzg3l_lvds *lvds;
> +	void __iomem *base;
> +	int ret;
> +
> +	lvds = devm_drm_bridge_alloc(dev, struct rzg3l_lvds, bridge,
> +				     &rzg3l_lvds_bridge_ops);
> +	if (IS_ERR(lvds))
> +		return PTR_ERR(lvds);
> +
> +	lvds->dev = dev;
> +	lvds->bridge.of_node = pdev->dev.of_node;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	lvds->regmap = devm_regmap_init_mmio(dev, base, &rzg3l_lvds_regmap_config);
> +	if (IS_ERR(lvds->regmap))
> +		return dev_err_probe(dev, PTR_ERR(lvds->regmap),
> +				     "failed to init regmap\n");
> +
> +	rstc = devm_reset_control_get_exclusive(dev, "rst");
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get rst\n");
> +
> +	arstc = devm_reset_control_get_exclusive(dev, "arst");
> +	if (IS_ERR(arstc))
> +		return dev_err_probe(dev, PTR_ERR(arstc),
> +				     "failed to get arst\n");
> +
> +	lvds->prstc = devm_reset_control_get_exclusive(dev, "prst");
> +	if (IS_ERR(lvds->prstc))
> +		return dev_err_probe(dev, PTR_ERR(lvds->prstc),
> +				     "failed to get prst\n");
> +
> +	lvds->lvd_rstc = devm_reset_control_get_exclusive(dev, "lvdrst");
> +	if (IS_ERR(lvds->lvd_rstc))
> +		return dev_err_probe(dev, PTR_ERR(lvds->lvd_rstc),
> +				     "failed to get core reset\n");
> +
> +	platform_set_drvdata(pdev, lvds);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable Runtime PM\n");
> +
> +	lvds->bridge.next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(lvds->bridge.next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(lvds->bridge.next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	ret = reset_control_assert(rstc);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = reset_control_assert(arstc);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_drm_bridge_add(dev, &lvds->bridge);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register drm bridge\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id rzg3l_lvds_of_table[] = {
> +	{ .compatible = "renesas,r9a08g046-lvds" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, rzg3l_lvds_of_table);
> +
> +static struct platform_driver rzg3l_lvds_platform_driver = {
> +	.probe		= rzg3l_lvds_probe,
> +	.driver		= {
> +		.name	= "rzg3l-lvds",
> +		.pm	= pm_ptr(&rzg3l_lvds_pm_ops),
> +		.of_match_table = rzg3l_lvds_of_table,
> +	},
> +};
> +
> +module_platform_driver(rzg3l_lvds_platform_driver);
> +
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas RZ/G3L LVDS Encoder Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> new file mode 100644
> index 000000000000..3dca3b630818
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RZ/G3L LVDS Interface Registers Definitions
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation
> + *
> + */
> +
> +#ifndef __RZG3L_LVDS_REGS_H__
> +#define __RZG3L_LVDS_REGS_H__
> +
> +#define LVDS_CMN			0x00
> +#define LVDS_CMN_RST_PHY0_SEL		(1 << 24)
> +#define LVDS_CMN_RST_PHY0_SEL_CH0	(1 << 24)
> +#define LVDS_CMN_PHY_RESET		(1 << 0)
> +
> +#define LVDS_0_PHY_OFFSET		0x10
> +#define LVDS_0_PHY_CH_IO_EN0_MSK	(0x1f)

One second toughts I think here we can go with plain numbers.
Apart from that the rest LGTM. You can keep my tags.

Thank you.

Kind Regards,
Tommaso

> +#define LVDS_0_PHY_CH_IO_EN0		(LVDS_0_PHY_CH_IO_EN0_MSK << 0)
> +#define LVDS_0_PHY_CH_EN_BGR		BIT(8)
> +#define LVDS_0_PHY_CH_EN_LDO		BIT(9)
> +
> +#define LVDS_0_CTL_OFFSET		0x14
> +#define LVDS_0_CTL_FMT_SEL0_MSK		GENMASK(23, 20)
> +
> +#endif /* __RZG3L_LVDS_REGS_H__ */
> -- 
> 2.43.0
> 
> 

