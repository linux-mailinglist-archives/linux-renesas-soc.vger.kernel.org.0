Return-Path: <linux-renesas-soc+bounces-32509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI2AJld2A2rf5wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:49:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88F52824F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4E833153B97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34224385D77;
	Tue, 12 May 2026 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rqoTq5nk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1CF38944D;
	Tue, 12 May 2026 18:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610510; cv=fail; b=tA4OcJaZDmv5mffLn8Tm+wYs4LWa3Dmwd0U1x5NQm65y/7nBxtz9tXeJpPirTgSS4f/VIYcBxhNoK7HVExA04mrvB4OK4RfK3lVNlglGA54zyBmQlgtWmCIcfj8UV+DEyEWs//sHZXKi1khhWE3fkWDBUDo2On3OrGOSSqJy/bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610510; c=relaxed/simple;
	bh=lruCE8XbScmwC9xNjBd9Yt9xUbPl7jckrSPS1x/iEiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r38lXSCOn0jg7mq3SR0Vr+IpxL4JUeOby7qGvHdd3K1yzbgrKgqJ6i7/gYYIccXX0u8gK7TBnpnMiWmW2fQxFrv+GfxOPjWiTyRxWAQ4BVQNIALrJYA2MT/xd8DbC4VVPjX7UsaEk8fOzLmK1ccfSXWLWyoa2biwkmw4W409Cck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rqoTq5nk; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUV2GeYGaQ8d/7HsST+HrpOrzKQVVBmUvWmiupDARsrfN5vv1gm+JbrtNi9NBOdIYOtwI04E1+e998Eh7sHC8zePG+UJCKquaPyZiPIdl4SL3g0IIC6iWY1eMyLqyejJD9DfeEQCKAm0L0ncDEUX1/31arNLdnWF8S4Xok5a0LqLxsVYawWexGlE9qsl1hgToYQeX2AZuUC6skYQ2gAdcOT1FxhsuA7e4Iv3yLOUkWX2jiZ20eEZd05ySQ1lO1fwTQCnL4sXK6OeW9fvOW7z06oFT3D0Qv595j1e8Bvhc+KEzWa+h0T2VudLuCYUIBydh9ERBzy/5P/+FWe4M1mwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrNFd46hcoMlRrUSwR6MNV4jQZfN1DQH0B34OUJa9gA=;
 b=fOUMVPMKWON2ojyFvHq56NPiyYy4xX29Rd8GWrILgniaE6C9sXLrLDVM6JWs7nqianHtWuaULiE3y+ruGn2svRbYIwIkRc1b03tXbBdUXHhgpD34eRtxWiZmJYJv0VOliWa/dHdARLwTSi/1n82lygs7oVCoR1LRJHmm4V9xAOa4uRdO76NasOLKtQ2a9g/QMYe7aoI/RO2hBW4EZW5zX4MPS+NLrt7fAfFBT9aV4Spc6081AyVokRrJdSuBDIy3+7FecxSsPE2CsFofIfU6cWdmpS7OfcQbdjMJJckvV8vEVQ1jUjeUIpa+hxF04keg0Oqbk0TDNuUd6b9IkQ3Gow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrNFd46hcoMlRrUSwR6MNV4jQZfN1DQH0B34OUJa9gA=;
 b=rqoTq5nk+nkjPCg19t6W6ASy8c1dweYUezN9IJg/SshXalaEsX8EHNKmcYghyAboHwL1YQZhw0mzgbOdgM3qRESqHZiSLbkdbUbsTm3dwNYAgGNTdjuoO3C9Pwb1UJu6UdZi8ikF0oHYAo8/JtHzWO1EiUGiaNHvIijvMq7EntI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8431.jpnprd01.prod.outlook.com (2603:1096:400:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 18:28:22 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:22 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 06/16] ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
Date: Tue, 12 May 2026 18:26:21 +0000
Message-Id: <20260512182631.3842065-7-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::17) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYWPR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b77c472-3f36-4414-8155-08deb0543f86
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|18002099003|22082099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	qI+sgDYPVgC1JNG8rjzVRGzYs1/iEjHkjNeI+NF3qhi4gUJTzNJteWDBO5IIHCm/cqDofiWILnryIrg33RPcDd3Au4JpV/KkTQciEFaKNVTCHcFUm05QojGNp5frlM/0b8HiNUynaqvJrmDawGSn3e1ZOG8fj+vN5QaPtlBBMjndyH19E4Mwt0GvcNZD6oXe0h8L8DH57Zn9D+8Gig8ueAWjPDrL5n5Jo4IQB6pR6pNL1nAfzWQ2Di2zJCQ7Sbp5kgAgnC7iIgGNv1EqaxYrzI/D0NXeuI2VZUhkYUbSxpdRjTJpK0xkiw+V47oLNZYmj2t/1sCzEEu6K3PVrCMBVN2vR0TO6rix/5ePY3t13HGjv/RL7U/82hGTxqISOKNh1eGXXYxriEJwLU2GEv53NvsAI3Pt29/x/PnFU/m2e99DIUmubWeJaIzKQv+lXESOmY0J9bXWh9TpmPOyO/ZK954lULqFRtt1Q8Y6oFAsrgQpystjubZYSzFktlyW5o/h5UTSv0HfXwq+jjZ7CUccS/XKeAi3Ua+1iAFMcjws3FM0myaUpOMld0ymzoZ4qUlhI91/p2r1Wc58XHS9f3V32uuEu543ki5naTEEFVYSkc7H26kHij0aFLcAaT5dI8Da5Cf8dDPilK2kIRdTHdt6DOOHxGeAdB/tfczIgYE4Sfs5BlWl8T4qitVCU59gYC1BKm6I5IvpGemWbY4No5zE4sCrQ1l6eu//l32ZkoKhNhY9sbgqCsK7dazgNq5G/RUo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QVKil+FVr0+hyPMPqWWbUd4hG8gD3TxI60QyKvEx8gW0G5P8MteMlrHoeWg7?=
 =?us-ascii?Q?+U3cMDAG1EBy5t3cKzPXi8gR/9S2ZgTnuLJRP1/Qa9HXsnFEml4koi8iUyon?=
 =?us-ascii?Q?N6hXR4eKkDslCh9+MvfeXjOHr72b3I44PsT3CEQlPgGeYP1EEs0/MSPn20Ja?=
 =?us-ascii?Q?A6b7GXBd3YumNP6baFsO17UBRjhtCrjhbtWg/78ofdAoY9TMnvxEpscGDgSY?=
 =?us-ascii?Q?FeYHWGGQoCiacUjkcPUheQSZjq9L3HnScm0dq87ddX9bR9k5SW1EfYADMkfm?=
 =?us-ascii?Q?Ff63Ks5eL90wD7LYNyFiCFkkYwbt5p3ckMZOXfGv25rhwdP745J/4I09ut4K?=
 =?us-ascii?Q?eQYRprX4xvi6TAPCVJLhLvAYv+QFX1Q9plO3NHT5vuVexZ89PNeJSpv3JXrb?=
 =?us-ascii?Q?lHrSVgIqyrP51rwOzrprRuMjxI2xhMXWR57mHFanSzgE5dDs6mDAVhIEb86p?=
 =?us-ascii?Q?il+6rwY00b+o9bzx5grl0QCdpJU6r+oPc5yVx6HzqKBjEa+KZQ4OXQyPLV4e?=
 =?us-ascii?Q?fbgmtfuuiuabnQGQI7JuAA7iXMZtejAJei6Ni3UIpD9OBhh3C7/t+zNizW/b?=
 =?us-ascii?Q?AWeZ8ml19T5jqzzAvOCTaw20qUYXDQ6sh5rQyEyQK5E5n4nRemhubafapTQp?=
 =?us-ascii?Q?KsjvqobHacL2M/sTc16VZGh8JD7rctMGxLnXPPFGa4d0cSG2z/1/qM624i63?=
 =?us-ascii?Q?5Tgn9uDzVqm9/vpsPOrL8WNnHECx3RYcvMW7qdJwtIk1mZKryolxVWGZJH8Z?=
 =?us-ascii?Q?lHN6wNgKOjRHfSRR6dWq0sABn0LFfDWOTF/SRo7saZAP4hiSucEJzN75oBKm?=
 =?us-ascii?Q?CiBQ8f0L2vnPMRxvxPhY/kP7GdqNdb7ASRUSV7Ebn9yaBAPTVpO9ZHKDo1fc?=
 =?us-ascii?Q?8JbhUqp/fWyxxq7JTKQQoEIe7hZ5o0aH4qL3xPvhmM1+V40tuZZp/y4q+JEV?=
 =?us-ascii?Q?pt99bTvW+kbEdKCiewcCqAX12k17mlsog9NlDdZf7Lpdu7pYYxdew7QVY/Kr?=
 =?us-ascii?Q?OX3XYa1jDKskedmJWshyQd0VwMpjC1TINLwnPliUAt4eyJVt64hr2N0YopNF?=
 =?us-ascii?Q?5g3NmYuYrQBboanqZHwfcH8M2Q7PplLUoxpE5ZTfPXHsdfQu/2Cihfe+2Ivo?=
 =?us-ascii?Q?LbQe3s3SlPg3aoeM+eGqaVrw5+TbCKFBegSaAo86UlJ/urYCbYLHFIfZteLE?=
 =?us-ascii?Q?uURil1yLpvEz5Rt0y0ae6+0YHspoutb6hRSQJoFLKrclPggfWsXz18wzzS6E?=
 =?us-ascii?Q?BtqYWVPuF1LiSQs8P7L6Egt+bSUL4B5ewaeLwg5NEqKT16ZMLrRMqvFeXkiy?=
 =?us-ascii?Q?cuik1eS6ARFAI7rGH8EgB+gdv96ezBMIigg6E0gkPhdH1s66ljYjh6/Z2Vze?=
 =?us-ascii?Q?yykjAQP7boIYqd9rCWov6sopEe8CmVzusg9vCE0uNrbcXd/rVCvVe8KlEI+d?=
 =?us-ascii?Q?4b8HKsaalpLRGCnm2vTH6Q8mQuzLiy/jhCLd3h8iUWGff5fDUV97Qmlb4EYF?=
 =?us-ascii?Q?OQOISN7IeBFR4MfdoMXBHypbBi5RDFiwNrB+9XOVtw+Y6qi7ifH/rOPx0rmu?=
 =?us-ascii?Q?xsdmQHTv1GMEFCK2y9ZvvBxFoZCbMpEKf1px7qNByKkaSbrfTGgubn0Mv5wc?=
 =?us-ascii?Q?fw6lHMehLK9Gm+Ld+0K6A56lbExmC6pu4dOWMlkvfY1XKoljmsmRtEJPQFKM?=
 =?us-ascii?Q?Pm+SUmx73d2CIenRhLxOrkCcD+L9ztDZb3xPVw5+RNZ9VoIc6GPFhmt9pPNE?=
 =?us-ascii?Q?TCxsw5a0VfoWrRWEdcsg8pkGsWHYZtc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b77c472-3f36-4414-8155-08deb0543f86
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:22.5660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMrZVGnfO1QRaAmBcsBfyr77gGIbat1Fr4H1rDqBDFD57DTq3NjXGWPcECZsX5bR4UjW2YO6axJ/GvB1teknJUH+VfApGgmkWGHrc7MPAJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431
X-Rspamd-Queue-Id: 2F88F52824F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32509-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

RZ/G3E requires additional audmapp clock and reset lines for
Audio DMA-PP operation.

Add global audmacpp clock/reset management in rsnd_dma_probe()
using optional APIs to remain transparent to other platforms.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6:
 - Enable the audmapp clock before deasserting the audmapp reset
   so the block sees a stable clock on the way out of reset.
 - Drop redundant braces around single-statement if blocks (style).

v5:
 - Add comment on audmapp clock/reset acquisition clarifying these
   are optional and transparent to platforms that don't have them
   in DT, per Kuninori's request.
 - Drop spurious blank line added to struct rsnd_priv in rsnd.h.

v4:
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv into
   struct rsnd_dma_ctrl.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/dma.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 68c859897e68..71774dae8847 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -47,6 +47,9 @@ struct rsnd_dma_ctrl {
 	phys_addr_t ppres;
 	int dmaen_num;
 	int dmapp_num;
+	/* RZ/G3E: Audio DMAC peri-peri clock and reset */
+	struct clk *audmapp_clk;
+	struct reset_control *audmapp_rstc;
 };
 
 #define rsnd_priv_to_dmac(p)	((struct rsnd_dma_ctrl *)(p)->dma)
@@ -864,6 +867,25 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	if (rsnd_is_gen4(priv))
 		goto audmapp_end;
 
+	/*
+	 * Audio DMAC peri-peri clock and reset for RZ/G3E.
+	 * These use optional APIs, so they gracefully return NULL
+	 * (no error) on platforms whose DT does not provide them.
+	 *
+	 * Enable the clock first so the block sees a stable clock on
+	 * the way out of reset, then deassert the reset line.
+	 */
+	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_clk))
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
+				     "failed to get audmapp clock\n");
+
+	dmac->audmapp_rstc =
+		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_rstc))
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
+				     "failed to get audmapp reset\n");
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audmapp");
 	if (!res) {
 		dev_err(dev, "lack of audmapp in DT\n");
-- 
2.25.1


