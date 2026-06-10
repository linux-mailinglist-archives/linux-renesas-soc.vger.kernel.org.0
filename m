Return-Path: <linux-renesas-soc+bounces-33799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mpyGNdIWKWqEQQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:48:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7669F666C28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:48:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=aSC+36d8;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6ED1A303CD2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35F83939B1;
	Wed, 10 Jun 2026 07:47:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C5835DA67;
	Wed, 10 Jun 2026 07:47:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077671; cv=fail; b=MC8LCk0B2SiOkdCfBM19FwWbpaPfsID7iDaIJv/UO+Zv3r6tfjjBBmG87kka4pXco+P4GeLGocwEoEd6CNZBjtmO/1QNMSDkv90a5lmTgcG0bpJEJmcvdBgQCymBTg1h/7i3yOC/fEJYKZjsUe/iqJqPRN0zdHrgRS1om/75liE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077671; c=relaxed/simple;
	bh=5PBYQej9718Kb/6Pe1Pex3vw08jopdQyEJOK2wOzVzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cV63OGHv/0AHVm8wCKO0urbzVjGUuWQJ0ihIKB0dNe/dPL24pOXI171OvxZObKj0eUOHkS0La5P3jVL/NYxBHdPhP+R3WmWM8zwWSgDZsUK8KX6zmNbnWsVYSTTbatcp+oz3vR4V3TzvOd5hO5ox/uPXXsZt6VwT4PRYcAK4C6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aSC+36d8; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6H0KZTXZW9S5pzBB6MCark9F604BZ2qbaRjzF2Fkj5b021rZJG7M1RepcimsEAoyVOK1fqeXAj47EOhXcrIjsX88jQ/r/MS6CeJG6gKmlJLiSXqjvbpGXZRa0GlreHSKZV5b8xTFwzPy/DnyreWCYg0RdrDzq4ypwG91HlqWEDuRsFxJm3BrbyN4qE31J8WhkrVXUz9fnGvQJ6ISI4jfs+Ztr2zq56GaEbm5lBRkUIeE71d1Slp1lyXroV/9Q1WIyQ52ag84nkp4cjj5PQxaofO3munbqpgmKbsIJnecXMNHscS1xX8D6v19uJB52R8NK2oZhxoa/of1MORgX6jGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAiPQ8Dptm4u2xw6i9bsw1PA4zbs/qqyTRBeb2jYOTA=;
 b=HD9Su+YdnPX7LMqgmPYjkF9B8xBzZ+9CtG1upouEdzSDlt0wJKjaLG/H+OTsKOn5x2SRfr0X7gUqL0buKs/gCLompeVqFqBzGGAtpafBEancdpFyYDzLDK1aITuMQVtjlqd1BSpZRn0q6bDlsMW1OHJv5YADMMHuvRSUkUq6QA1aM10JtwgWHn9b0iYBFma9TI2vKy0d1o1ae5akg76dFx+kmmXUi3vrnRhPAdqwGSR1XZfxken1ScMm2sKNSepdIPDGs8sxs0tnuqOV3NLL9RVd5hjUJOhzj5yooHL/2jumErcigeSKgLky/W+XjTICKpnJlGtdQSeQ0ROK+j0vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAiPQ8Dptm4u2xw6i9bsw1PA4zbs/qqyTRBeb2jYOTA=;
 b=aSC+36d8Qddtfsp+o8Qlm44Zm7/7QXWCpJpu3Uv3QqvbdWNZW+UY6TD1gtdQbzMZV1FELwXq0gO+7PPBvrzfZQ9BzzTZ4/Ej2LeYQMGicUYjdMzoBydqSVEja8053syD60Lz5VlvcDFx+S9MNoFsw9A0HHzDIxwr8fQYCHrpHzQ=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS7PR01MB13812.jpnprd01.prod.outlook.com (2603:1096:604:368::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:47:47 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 07:47:47 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 4/4] arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec support
Date: Wed, 10 Jun 2026 07:47:02 +0000
Message-Id: <20260610074702.1743334-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
References: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS7PR01MB13812:EE_
X-MS-Office365-Filtering-Correlation-Id: 851c1a7d-1c67-47be-e5fb-08dec6c49084
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|38350700014|11063799006|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NT5iGokYAcMLz9953ARhIiHJhOi1+7RhqYQ+qSR5bafuECoOf8NcM8jImieA6n6ogqRZJv8BgHHSt4vy36C3pInoEQPU+PtZzAaEgQxSfWo0Xc1PTz365g9OJgfbj2Sfy4p5+ltCm6hTSji+KAD5tFo3uf/m/0gCIeYEEdQz/REUcByXI+3FsOTWm7PwLBxpmDzKjCtKSFdC8rMVD0QzOu/AoqFafTam6uH54qvzgxgRTvDLOa1G2d/U5khwfxWK+DQouZbJExPE/zkkEX/Nbu/vnVmpyw90ELqWNEUTlwi3QHEw8qRQtUoIDQg9Zqch5zoXmPwSGBfFZ6bM0qdH/oJlNaQLgmyjbEcJWhlE84VVedE45M7eTqDlthrYn+1OFsB55BEahy1/RwxeMrSCMGTBO6yCaUusESku6dvYp2IiUShFJdR0nQLTlK/rXcFwvv4s2XnqvfBU+bSSe+oGwW/eXzR7BuwJONIYklPY21JN5jgJFKR1FpY4cIlfth/fqLgb/7ly5juT5so5uWZb4xDQxxq76P+dpn6Ys4ejqAhJsFGwsHl1MirKaMDNObAlINtgsHSGmEdZIOJkoa1XPotp2MVewy1UlwtYsrk14gbh984QfW1z298uMTXIZqZx3jqAUengmuGPY7S+ePQasqyIsh0/A1Z2JDDMFHSHXl3VXXwKprD0Ke2Y3rPe8Iui5C6FRs3l6PNCk2ggiUTJNJ9HS9neQoABfLjPEfcpYWELmxg/ZKU/9q0y0YKvgaaR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(38350700014)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XtDX6Y5ehbLQGzLTJigWogrOvfGdnP1D7e4z4AP9heRBdC9lcRoXRXEYyX4l?=
 =?us-ascii?Q?zs9CEDV70+ML7hgFNDDMccDkklLyULmBwWEbLznh/1gKxLv7mvWjqLKDyD7z?=
 =?us-ascii?Q?FJQv2xoMUhuw4Iil8RaaJok1WBDZG+ZYB4ds0kuP72J5pSgA6HhzYfXVlLQR?=
 =?us-ascii?Q?HJ6Z64ahVTB8TDvWFPz2NfWVvFD9QnHnpoQemZYWsB6zR57r28ReMpkj1J4S?=
 =?us-ascii?Q?4Ex+FCTOqMZuS+y0Ss3E6dQJvHKd1VK1L0CbXSaJYcVqMbtt7gr2vigjp6B9?=
 =?us-ascii?Q?XS8B9/hjjq5E963o6eAZNNF4sQCZOncWopMONeyPZrzrDpWOMwlOlSEfvNOO?=
 =?us-ascii?Q?xznf4udkGyKq9QbfMYp3JqPyvlC6RBIvRIDAdlNzrE1jjTzvtJ6PdCOcbCUN?=
 =?us-ascii?Q?swcKH33FAZMfj6rNshLDSnvEMKKjvDkULUuV0D/ShF68Ws0tl77g/B/zH14I?=
 =?us-ascii?Q?GAdcn6CN6ijwvYOAbxFMTB+uttIfj+cbWzohE1M7DHZWSfVODVVxrpsPm/YI?=
 =?us-ascii?Q?hqQxtpcr+N2ijMQJ31FPj+Md+opAN+YU3rlD/C3fhX/fbGt8CCtJCDgHnQBe?=
 =?us-ascii?Q?XQ1HtoOgapq8DGuMPZ1F6c/JEutR2F43VPXpVsul+4YioeUzNXHWejzqyv12?=
 =?us-ascii?Q?j1ZRcgfYhqaFsZzuq+ZP5BNmrKs2gggxBTXjXxf4e+6QMGuuaw1TOrfOFWXT?=
 =?us-ascii?Q?L7JZOWaoQHdihy6UzWIOHMWlL0aCHSxgtCgbEF6+rAaBbMk7Rx7wUSJ8wo6W?=
 =?us-ascii?Q?NfeA7QSs6+smLGO7oO6omCVDNSpgJlVJfPQGNriTLqVKvavDFEyi4gUVTAwd?=
 =?us-ascii?Q?kqcXM/H/7C9txsDtnkYj0bHAz4lgO7lLeoltFwxCbL8+ppMF8Ezxdry4hRqd?=
 =?us-ascii?Q?zJLv6Acc+BNgIWwRJNucGrNBLpWep+iwRE/EOOQgQJRTVMMg2UffyNYxxnYY?=
 =?us-ascii?Q?NCW4Vu0sxJ6NyC/WfPDFHYrmZdZx8EoXhgtC1Luk+aM2yF4215wI4XDQOSiS?=
 =?us-ascii?Q?FNtqD+la48Z7BkQ7cEfPiFaYhF7pooRAp1IlmlrDwvx+cWjdEK1u+Dddj1Jx?=
 =?us-ascii?Q?5mOPMrvGIejmKPRCDSv0MQqsv769CfxEUsVr8xQi45ZPkjDUm6wiaXXGtUN5?=
 =?us-ascii?Q?f3kuHlTY7QuEPAw9vdDVCOpdTimtfvcpIhVFL0AXiYIMvyb4a/DeZHgtjJcm?=
 =?us-ascii?Q?2kq+/7iPbfN22eEiNtHhM4L3+UcWZLBRpPRHn9uMircLMC74v9ztJJfl6uRK?=
 =?us-ascii?Q?gI7Ot5lz5+yOtHAin9BbBcR1CW8/CB0/q/EhCmx4deyGVRC961JHH7LAAFrN?=
 =?us-ascii?Q?b+n7ojIt7K6zClwi4Ph0XAsQpn6yh5MlRUgbTis0Rj6neWicGiUqZN3iczfZ?=
 =?us-ascii?Q?LMImE4IawlIfUu0mMeh0EAMjDxOMEkPTCyxqu7DZknLQualT8QuhXb0YtTt/?=
 =?us-ascii?Q?MhxGqiqhbaGCqpnbvJcgR/pICoZWXk5fTDC6F9pgHROM7hT+wvVE60Oifrwn?=
 =?us-ascii?Q?FuSfbZkaJsCamOWH+RZmf2yBXiLkNPXOzNUOFp6cENpgIPzBlmZxrpF9aAx/?=
 =?us-ascii?Q?qCz0Qrtg5Y2xPuELMcdHh0IqrXptS2fkmICqHNpBd7AX9rWLI104rwg/4Ew0?=
 =?us-ascii?Q?nlxmVvEZfXt5tL2C9ySPC2UifDjfJ6ptGl/BHcWq2Fvj0I9idIqfLHHMfyUV?=
 =?us-ascii?Q?dcs/CW2vGX8dCJ8K8MTT6LVNsiUSGcMPZqikwUecOsY4Bev3lMLsPg5oorPw?=
 =?us-ascii?Q?G32sg9gr989cpeNWvKBTxVOxTNkPCaE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851c1a7d-1c67-47be-e5fb-08dec6c49084
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:47:47.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKddWzrKY8siajhG39ajH4SJQ4rP0t6o3kpuFFmiUIrVsrfZfIHzOkY6f5FkXZ4U+LaKRXRFoS+TJ6nUgoyo27LYg3qDh08rid0VdojAy/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33799-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7669F666C28

RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
sound input/output using SSI3/SSI4 where:

 - The codec receives its master clock from the Versa3 clock
   generator present on the SoM
 - SSI4 shares clock pins with SSI3 to provide a separate data
   line for full-duplex audio capture.

Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: No changes
v4: No changes
v3: No changes
v2: No changes

 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 6372f582a7c4..7defd342294a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -32,6 +32,37 @@
 #include "rzg3e-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
+/*
+ * SSI-DA7212
+ *
+ * These commands are required when Playback/Capture
+ *
+ *	amixer -q cset name='Aux Switch' on
+ *	amixer -q cset name='Mixin Left Aux Left Switch' on
+ *	amixer -q cset name='Mixin Right Aux Right Switch' on
+ *	amixer -q cset name='ADC Switch' on
+ *	amixer -q cset name='Mixout Right Mixin Right Switch' off
+ *	amixer -q cset name='Mixout Left Mixin Left Switch' off
+ *	amixer -q cset name='Headphone Volume' 70%
+ *	amixer -q cset name='Headphone Switch' on
+ *	amixer -q cset name='Mixout Left DAC Left Switch' on
+ *	amixer -q cset name='Mixout Right DAC Right Switch' on
+ *	amixer -q cset name='DAC Left Source MUX' 'DAI Input Left'
+ *	amixer -q cset name='DAC Right Source MUX' 'DAI Input Right'
+ *	amixer -q sset 'Mic 1 Amp Source MUX' 'MIC_P'
+ *	amixer -q sset 'Mic 2 Amp Source MUX' 'MIC_P'
+ *	amixer -q sset 'Mixin Left Mic 1' on
+ *	amixer -q sset 'Mixin Right Mic 2' on
+ *	amixer -q sset 'Mic 1' 90% on
+ *	amixer -q sset 'Mic 2' 90% on
+ *	amixer -q sset 'Lineout' 80% on
+ *	amixer -q set "Headphone" 100% on
+ *
+ * When Capture chained with DVC, use this command to amplify sound
+ *	amixer set 'DVC In',0 80%
+ * For playback, use: amixer set 'DVC Out',0 80%
+ */
+
 / {
 	model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
@@ -55,6 +86,22 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
 	};
+
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "snd-rzg3e";
+
+		dais = <&rsnd_port0>;	/* DA7212 */
+	};
+};
+
+&audio_clkb {
+	clock-frequency = <11289600>;
+};
+
+&audio_clkc {
+	clock-frequency = <12288000>;
 };
 
 &canfd {
@@ -99,6 +146,37 @@ &i2c0 {
 	pinctrl-names = "default";
 };
 
+&i2c1 {
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		#sound-dai-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x1a>;
+
+		clocks = <&versa3 1>;
+		clock-names = "mclk";
+
+		dlg,micbias1-lvl = <2500>;
+		dlg,micbias2-lvl = <2500>;
+		dlg,dmic-data-sel = "lrise_rfall";
+		dlg,dmic-samplephase = "between_clkedge";
+		dlg,dmic-clkrate = <3000000>;
+
+		VDDA-supply = <&reg_1p8v>;
+		VDDSP-supply = <&reg_3p3v>;
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_1p8v>;
+
+		port {
+			da7212_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint0>;
+				mclk-fs = <256>;
+			};
+		};
+	};
+};
+
 &keys {
 	pinctrl-0 = <&nmi_pins>;
 	pinctrl-names = "default";
@@ -280,6 +358,42 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&snd_rzg3e {
+	pinctrl-0 = <&sound_clk_pins &sound_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* audio_clkout */
+	#clock-cells = <0>;
+	clock-frequency = <11289600>;
+
+	/* Multi DAI */
+	#sound-dai-cells = <1>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		rsnd_port0: port@0 {
+			reg = <0>;
+			rsnd_endpoint0: endpoint {
+				remote-endpoint = <&da7212_endpoint>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint0>;
+				frame-master = <&rsnd_endpoint0>;
+
+				playback = <&ssi3>, <&src1>, <&dvc1>;
+				capture = <&ssi4>, <&src0>, <&dvc0>;
+			};
+		};
+	};
+};
+
+&ssi4 {
+	shared-pin;
+};
+
 &usb3_phy {
 	status = "okay";
 };
-- 
2.25.1


