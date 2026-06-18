Return-Path: <linux-renesas-soc+bounces-34216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NsPiFZJCNGrOTAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 21:10:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B95456A24CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 21:10:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=rGcoexLm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDDED301A297
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 19:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6398932C302;
	Thu, 18 Jun 2026 19:10:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1A2AE8D;
	Thu, 18 Jun 2026 19:10:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781809807; cv=fail; b=eziTWskFbQwROKJixhPYYTF/7rCJwniIbjoStnqwbMdOZsgwvZ0xaDXWJzfmE7LlW89rcjmKWpMZa/2UxfCoKRPPIJv8VyRMclx35EelVHDVGz1CSsPRAKXuhIkGCQJ+KRSG+3oaryywQXiYhb9PqpXhR/OEeGDrbotTKWTYYwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781809807; c=relaxed/simple;
	bh=GCH6Xlvq0gOas/m+SnjBti9ZH5I2jC/jjWM3HEN4H4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FW957NusCnUZlCzyq+iXdQ5vBMfA4shYZIPunmlE7AIdANbrT9z4sVB1iAkDLAAImwMlxGyDjeMrSqSJn4p8IB4bPMK5iGQTd/Pv648iZPLBrTfdRn0Kc2gfyZNUdNNb9jYgussE6RYtQV1VtbD4x1WhDTJ1lJGIAkC4yohuesM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rGcoexLm; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdhmMu369JwKd0BLSXQpCRdxwSE3K+LwX6IPnE17MHkDqM12Oz3u11UG5dZLWZYuWk6doXLTDM+ECwF0dPtSWXHr2CXnpWPur/5/0DVLvGdF2eUUD2on/nWZkGtKmATo7HXHTdTxGLGGeItBUoYDbSjg1tq1ST7SuDQMfXKheXJIroqvPTdOx8NMh6eRsAdvmXLVbObGD8xu0bUG9EYURVMfCP3ULgAhlCedZSKtjD7y36pdfYZR9IqoWUCNAi0/886B/XV+1HTRge1X6qOFWmt+JGKEPFsjSoveVJ1cw1VwfLnVX2cXOa4DTwN5WLky93ONQFSziJZE6XOUZX6zxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEjY3n2r5juM4yFbx9sm6R0q7N2NTiCNhkDyTJ8NLAI=;
 b=cA43qVJ4+/cSvYkfBVdsMj3uGG2xhtkDs5iHN7L7wPnkA+Q3V0zK1IaAkSuFf94rO3RJnE5jj0SxwdjtRlqo7vs+PVR1sWhUdyb419lh8sLX5JipDM/k1IGynWRw0fvtwGi9f4pkoPbd0gSG7STx+iq/t9iQZkETrceA/Oi/xOEjTKLHj8bmZgXNvZq3YmvsLXlPiG8cV4PiG0dWbJCVUzCCT7TZX6iShrGKhxjPh2ex+TFm2vAAaEFRfwbBJ6SblfRkq5zPB47MEXyeQ8NIw8rUhUaU3G8yMUERfRIWjOme3zH8QGrC2qlGsLb9YQA1lxgdbwMvNuT91vFeTnoqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEjY3n2r5juM4yFbx9sm6R0q7N2NTiCNhkDyTJ8NLAI=;
 b=rGcoexLm7kfqM2bV0HIWnynmiyZROFVBjFfWJZp0XrbKrXxSC8afs48e9WIxQ9x09vo2O887/ky/8OCCdOLvd1Sf7aqjdj5u/ojnVaLhyOo23M25vdk1X4sU4CiDUmaqNwvg7u9CFufqdt0C0Nse+gEv4Jso4m0bcEWz3Ao7C5Y=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB17516.jpnprd01.prod.outlook.com (2603:1096:604:450::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 19:10:02 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 19:10:02 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH] PCI: rzg3s-host: Re-enumerate the bus on PCIe link-state changes
Date: Thu, 18 Jun 2026 19:09:35 +0000
Message-Id: <20260618190935.3018531-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::10) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS9PR01MB17516:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4265e6-934f-4512-06a0-08decd6d32b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|52116014|376014|1800799024|56012099006|3023799007|11063799006|6133799003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info:
	7mOzp2ysw6qniaw1RJPGRKptUaTyssNL/Ph3dDxXlXWiwgDAnkt2vrz6+Nj/LyqygdKFgm42s+jIK4+NglbSnSv6wPCIwNaQ5UG58AEzOMyiiZJ1FeBe//pIEAuEpuJHM7OTtS9xn2kP3xBxVwqhzufoXnhZUbHX87eWqcfgY5G7fsuNpXfDgEl3I8R0tGtRjXYgkpFzU7cPGcfHgG6EqlF0eNIdzzZpI+QuW4d0hYf6ynUVJTHtwk+RnxfK3F0dw2z/rdkdQCPDKaUsZU2mJoJBkrauN7BcLQxJkLl1r6NbwN0mFlOfxDgE0j85VX0MiWzWuXUhUy0QHFPQY/UOJTLSIqb4fCrBnDJvdoAteC3zOJzaQeAkciIEojtli3JOX8UvZ6vpGSa8whcbgB33hvBoZ3uYemLt4vv5Q/sTUdBXX6Yx4+Fy38sa9wzN322gh1K2335oS+l7i/UOLEuCOMw7cDB84peO/iQVPBXuZ1KIsz3Jovgqs7icMKGJNp8sfCvFeZQYLntCuWd1s45+7vNKKtHwqV7JBEWddACyfKwgBpomDcYm+UciKyNZYGp9+RApSb2S7aoRr2U2Y2hnbjtPOXURx8WQdgJBBDCEh6FbFNtsHnDbzn6h9+zD7jsGuLD32oS3/r9TLGO2YTobF4/rqgMtiXCCzzAyQo17JC9dyeDqtOLibL7CLo5UGz75Eli7iW18RM8taY4yx9vjIfxQWTgQ1LMb/US6MHtA1ZuUyCUvuSJrFUq01WPxzC1J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(52116014)(376014)(1800799024)(56012099006)(3023799007)(11063799006)(6133799003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NcrQUZog8xo/tLhMfNX3SG5JbIDJfiS6k/LmL8dPSt8DF9E7XYNSWvHvRege?=
 =?us-ascii?Q?dNu4agWWODeLjOdJA8alqg2XdYWbLI2jaE2Hcn8ItqyoHmSOoQTDToCxusH5?=
 =?us-ascii?Q?ghYUs4bPq/QSCVOSkbfyGgI1+aJTwElXqqGqHlxz81bPH5bQWQvZ4x3uNjkL?=
 =?us-ascii?Q?3auuEndSL4uEUmgdiSKJTGN7ZUR8dOIxti8EnYvjZpSXU4yYMoL23Bgj3OVC?=
 =?us-ascii?Q?iVpeOCCFBIxPhYAXzpLMaBC8Z2BHLS+2xKHLksf6c1jJOejXmUKGkuK9QO+f?=
 =?us-ascii?Q?sfzv64/6lKGS3AONmypr0YBkehJZNEN9NCCXsS6E1ZtvvN0rZ3RqptAtArER?=
 =?us-ascii?Q?NF7kJvxcd1KAKGbi4/t1w1y8GS5f0Rxmm0Q9doWmXK4C7Cl5031lR5ZFuWwP?=
 =?us-ascii?Q?61vzAfCKdXdjLlQ2G7LXdj5nvWSPLDzDyOLy6D9ntaWFqtJ5pWOluPJN5/Je?=
 =?us-ascii?Q?T9ORE7FSZPyvFWQ7EiBsVGbwewZlxZFEFjde7W+xhpb+gCoi+glyTUmAZ6OX?=
 =?us-ascii?Q?daHR4ifdhwUYBinigkLYRrCKL+x6EsPAjQh0+7QzOFvEJaXwgUbfS/PtClf/?=
 =?us-ascii?Q?yNTMOEGDcsCTf0kbH5j0EzRHdNhwPDHR8kMJ8yUZNPmnMLpPNrYjysTwIxvg?=
 =?us-ascii?Q?ZmhtJtucBuwCemG8tnkcZvkSsz2eQ+K8XagJEL459U38cNqgRW1jC4OdOHzq?=
 =?us-ascii?Q?V6EreW4bO4Sp4qv4gPzokVq7xklA8psd54isyPTGpusCrpuVvW8LJmauWIfn?=
 =?us-ascii?Q?erKUydsbN/fXGz6fcgPccrEjw7acPsVmFCKSLGQk/uvVzdwelxCZbDKRKsH1?=
 =?us-ascii?Q?KXkvTXgKANe+qr8xXbkMAdjppttO4LtuCvLLFGGME5+NcnxSjpS72lbeNLbm?=
 =?us-ascii?Q?QWv8kPy7fJsMmiYWticpOHLP5cpUy+C/3i9CZE/Yj19rNGakNOXDIGR3BdoO?=
 =?us-ascii?Q?oHT9gtN85x2OpDUp5mtRK1VZliPV13zj5P/EHCha6NjlLJ9VttBjUlUSypTn?=
 =?us-ascii?Q?Qi/y8rvtQLvTQCigsHTGd1/FhDujmgd7JOkUaN6xDAXGIZHEqVPcU0vJFnKZ?=
 =?us-ascii?Q?MmOAypRPIpPvhKgvXtMbLfWnEjkahgRrWq5D8lj+RwOgXXSCYABzITzba0o8?=
 =?us-ascii?Q?csqPVr+IvdQRpiiP8IsoW374YJmo9RWKiTz2GSqB10bzAN6iUVQjaKaeIv7L?=
 =?us-ascii?Q?TE3lmiyEO7ZgBIdNyhMr7Ov90HmGWo0IdYXoiQqoH1NH3hHDf/mdR4m9+rxI?=
 =?us-ascii?Q?E7433WgEgiRb2jsQtfOoRt4YpN350VloXbIOLde9knlTpbGKqGM/QztT5ese?=
 =?us-ascii?Q?9hexFHLkGcqxtwPLC1TqHhkzwXMyX2Dp7IOVmcwbiw0IzMqXoEjDrrLOMyIm?=
 =?us-ascii?Q?QXlcdD8q5p6hnQzhH0H8nnEvBa4Dl8jIul6B1rcVlkdZ4BSvpW9lqOCBIsmf?=
 =?us-ascii?Q?y4n1Qmq7p+w4l7GQCTZSnCeb7oOPOuRBtkSAh4O55NNdc1u5g7SiCyMA5E1e?=
 =?us-ascii?Q?syhhmQeNBpiuaQcWX5cUKxICEfS22cm3F+LnB5Vx3+pVdZAVwvGzfrmF8KNe?=
 =?us-ascii?Q?D2IWamgXp70oolDppCvP6wt4CqWCS3kEyZaaZflJ2QXRuZKaVtMokEVsFZOD?=
 =?us-ascii?Q?fO/kC0Vavsd+KTkuJmMDGGZCbSMSyFt2M0VBbax+yOGp91PXW4By6SEKwopz?=
 =?us-ascii?Q?yPRot/hlEmELneawr3MwtcFPikJv1xrW3mqQ5b301rSZJYveWuLh+lN0gGEB?=
 =?us-ascii?Q?Qr0RhOesIN3gCTkpZNUp5f4ZJFHi1ic=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4265e6-934f-4512-06a0-08decd6d32b5
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:10:02.0809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMnwKZsdkD6ReU8M5egl9LRp3HoSIyi13ziGKlvqakrgdam/vev8jbwWXO9/s94qFgIZC4b5BU/wr1lAH27lxmNfygEl3oIJ8OhtVDgAOw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17516
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34216-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,bp.renesas.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea.uj@bp.renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:robh@kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert+renesas@glider.be,m:john.madieu.xa@bp.renesas.com,m:johnmadieu@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B95456A24CB

The RZ/G3E PCIe controller does not expose the standard PCIe Slot
Capability registers, so the generic pciehp driver cannot be used. The
only link-state signal the hardware provides is the DL_UpDown bit in the
PEIS0 event status register, which is raised on every Data Link layer
up/down transition.

Enable DL_UpDown in PEIE0 and hook up an interrupt handler so the driver
can react to link-state changes: a device that trains after boot gets
enumerated, and a device that disappears on link loss is removed. This
provides hotplug-like behaviour without the PCI hotplug core, which is
unavailable for the reason above.

On a DL_UpDown event the handler acks the W1C status bit and schedules a
worker that inspects PCSTAT1.DL_DOWN_STS:

  - link up: re-run max link speed negotiation, wait for the link to
    settle and pci_rescan_bus() the root bus;
  - link down: walk the bus in reverse and
    pci_stop_and_remove_bus_device() each child.

Both paths take pci_lock_rescan_remove() to serialise against the PCI
core.

Link events are only acted upon once the controller is fully
initialised. A DL_UpDown latched while the registers are not configured,
for example when the event IRQ is used as a system wakeup source during
resume, is acknowledged but does not schedule a rescan. The
hw_initialized flag, set at the end of controller setup and cleared on
suspend, gates this.

While at it, make probe tolerant of an absent device. Previously, if the
link failed to come up during rzg3s_pcie_host_init(), probe tore the
controller back down and failed. Distinguish this case with -ENODEV,
leave the controller and refclk running, and let the link-up path
enumerate the device once it appears.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 153 +++++++++++++++++++++--
 1 file changed, 143 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index d86e7516dcc2..5a10422ced2e 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -34,6 +34,7 @@
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/units.h>
+#include <linux/workqueue.h>
 
 #include "../pci.h"
 
@@ -294,7 +295,12 @@ struct rzg3s_pcie_port {
  * @msi: MSI data structure
  * @port: PCIe Root Port
  * @hw_lock: lock for access to the HW resources
+ * @link_work: work for DL_UpDown link-state change handling
+ * @event_irq: PCIe event interrupt for DL_UpDown detection
  * @intx_irqs: INTx interrupts
+ * @hw_initialized: set once the controller HW is fully initialised; gates
+ *                  DL_UpDown event handling against events latched while
+ *                  the registers are not configured
  * @max_link_speed: maximum supported link speed
  */
 struct rzg3s_pcie_host {
@@ -309,7 +315,10 @@ struct rzg3s_pcie_host {
 	struct rzg3s_pcie_msi msi;
 	struct rzg3s_pcie_port port;
 	raw_spinlock_t hw_lock;
+	struct work_struct link_work;
+	int event_irq;
 	int intx_irqs[PCI_NUM_INTX];
+	bool hw_initialized;
 	int max_link_speed;
 };
 
@@ -575,6 +584,30 @@ static irqreturn_t rzg3s_pcie_msi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rzg3s_pcie_event_irq(int irq, void *data)
+{
+	struct rzg3s_pcie_host *host = data;
+	u32 status;
+
+	status = readl_relaxed(host->axi + RZG3S_PCI_PEIS0);
+
+	if (!(status & RZG3S_PCI_PEIS0_DL_UPDOWN))
+		return IRQ_NONE;
+
+	/* Clear the DL_UpDown status (W1C) */
+	writel_relaxed(RZG3S_PCI_PEIS0_DL_UPDOWN, host->axi + RZG3S_PCI_PEIS0);
+
+	/*
+	 * Drop the event until the controller is fully initialised. The
+	 * event IRQ may act as a system wakeup source and fire during
+	 * resume before the HW registers have been reconfigured.
+	 */
+	if (READ_ONCE(host->hw_initialized))
+		schedule_work(&host->link_work);
+
+	return IRQ_HANDLED;
+}
+
 static void rzg3s_pcie_msi_irq_ack(struct irq_data *d)
 {
 	struct rzg3s_pcie_msi *msi = irq_data_get_irq_chip_data(d);
@@ -1107,6 +1140,47 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
 	return ret;
 }
 
+static void rzg3s_pcie_link_work(struct work_struct *work)
+{
+	struct rzg3s_pcie_host *host =
+		container_of(work, struct rzg3s_pcie_host, link_work);
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
+	struct pci_bus *bus = bridge->bus;
+	u32 val;
+
+	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT1);
+	if (val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS) {
+		struct pci_dev *dev, *tmp;
+
+		dev_info(host->dev, "PCIe link down, removing devices\n");
+
+		pci_lock_rescan_remove();
+		list_for_each_entry_safe_reverse(dev, tmp,
+						 &bus->devices, bus_list)
+			pci_stop_and_remove_bus_device(dev);
+		pci_unlock_rescan_remove();
+	} else {
+		int ret;
+
+		dev_info(host->dev, "PCIe link up, rescanning bus\n");
+
+		/*
+		 * Attempt link speed negotiation now that the link is up.
+		 * Failure is non-fatal: the device works at the negotiated
+		 * speed.
+		 */
+		ret = rzg3s_pcie_set_max_link_speed(host);
+		if (ret)
+			dev_info(host->dev, "Failed to set max link speed\n");
+
+		msleep(PCIE_RESET_CONFIG_WAIT_MS);
+
+		pci_lock_rescan_remove();
+		pci_rescan_bus(bus);
+		pci_unlock_rescan_remove();
+	}
+}
+
 static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
@@ -1217,8 +1291,8 @@ static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
 		       RZG3S_PCI_PEIS0_RX_DLLP_PM_ENTER,
 		       host->axi + RZG3S_PCI_PEIS0);
 
-	/* Disable all interrupts */
-	writel_relaxed(0, host->axi + RZG3S_PCI_PEIE0);
+	/* Enable DL_UpDown interrupt for link state change detection */
+	writel_relaxed(RZG3S_PCI_PEIS0_DL_UPDOWN, host->axi + RZG3S_PCI_PEIE0);
 
 	/* Clear all parity and ecc error interrupts */
 	writel_relaxed(~0U, host->axi + RZG3S_PCI_PEIS1);
@@ -1384,16 +1458,21 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 				 PCIE_LINK_WAIT_SLEEP_MS * MILLI,
 				 PCIE_LINK_WAIT_SLEEP_MS * MILLI *
 				 PCIE_LINK_WAIT_MAX_RETRIES);
-	if (ret)
-		goto config_deinit_post;
+	if (ret) {
+		/*
+		 * Link is down. Leave the controller running so the
+		 * DL_UpDown handler can enumerate a device that appears
+		 * later.
+		 */
+		dev_info(host->dev, "PCIe link down, waiting for DL_UpDown\n");
+		ret = -ENODEV;
+	}
 
 	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
 	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
 
-	return 0;
+	return ret;
 
-config_deinit_post:
-	host->data->config_deinit(host);
 config_deinit_and_refclk:
 	clk_disable_unprepare(host->port.refclk);
 config_deinit:
@@ -1655,8 +1734,15 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
 
 	ret = rzg3s_pcie_host_init(host);
 	if (ret) {
-		dev_err_probe(dev, ret, "Failed to initialize the HW!\n");
-		goto teardown_irqdomain;
+		if (ret != -ENODEV) {
+			dev_err_probe(dev, ret,
+				      "Failed to initialize the HW!\n");
+			goto teardown_irqdomain;
+		}
+
+		/* Link is down: hotplug via DL_UpDown will recover. */
+		WRITE_ONCE(host->hw_initialized, true);
+		return 0;
 	}
 
 	ret = rzg3s_pcie_set_max_link_speed(host);
@@ -1665,6 +1751,8 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
 
+	WRITE_ONCE(host->hw_initialized, true);
+
 	return 0;
 
 teardown_irqdomain:
@@ -1682,6 +1770,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		of_parse_phandle(np, "renesas,sysc", 0);
 	struct rzg3s_pcie_host *host;
 	struct rzg3s_sysc *sysc;
+	const char *evt_name;
 	int ret;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*host));
@@ -1745,6 +1834,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	raw_spin_lock_init(&host->hw_lock);
+	INIT_WORK(&host->link_work, rzg3s_pcie_link_work);
 
 	ret = rzg3s_pcie_host_setup(host, rzg3s_pcie_init_irqdomain,
 				    rzg3s_pcie_teardown_irqdomain);
@@ -1758,8 +1848,39 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto host_probe_teardown;
 
+	/*
+	 * Request the PCIe event IRQ at the end of probe to avoid
+	 * spurious link-state events during controller setup and bus
+	 * enumeration. From here on, DL_UpDown events trigger the link
+	 * worker to (re)scan the bus.
+	 */
+	host->event_irq = platform_get_irq_byname(pdev, "pcie_evt");
+	if (host->event_irq < 0) {
+		ret = host->event_irq;
+		goto pci_host_remove;
+	}
+
+	evt_name = devm_kasprintf(dev, GFP_KERNEL, "%s-pcie-evt",
+				  dev_name(dev));
+	if (!evt_name) {
+		ret = -ENOMEM;
+		goto pci_host_remove;
+	}
+
+	ret = request_irq(host->event_irq, rzg3s_pcie_event_irq, 0,
+			  evt_name, host);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to request pcie_evt IRQ\n");
+		goto pci_host_remove;
+	}
+
 	return 0;
 
+pci_host_remove:
+	pci_lock_rescan_remove();
+	pci_stop_root_bus(bridge->bus);
+	pci_remove_root_bus(bridge->bus);
+	pci_unlock_rescan_remove();
 host_probe_teardown:
 	rzg3s_pcie_teardown_irqdomain(host);
 	host->data->config_deinit(host);
@@ -1789,9 +1910,19 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 	struct rzg3s_sysc *sysc = host->sysc;
 	int ret;
 
+	/*
+	 * Stop accepting DL_UpDown events, then drain any worker that may
+	 * already be running, before tearing the controller down.
+	 */
+	WRITE_ONCE(host->hw_initialized, false);
+	cancel_work_sync(&host->link_work);
+
 	ret = pm_runtime_put_sync(dev);
-	if (ret)
+	if (ret) {
+		/* Suspend aborted; keep handling DL_UpDown events. */
+		WRITE_ONCE(host->hw_initialized, true);
 		return ret;
+	}
 
 	clk_disable_unprepare(port->refclk);
 
@@ -1822,6 +1953,8 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
 refclk_restore:
 	clk_prepare_enable(port->refclk);
 	pm_runtime_resume_and_get(dev);
+	/* Controller is alive again; resume DL_UpDown handling. */
+	WRITE_ONCE(host->hw_initialized, true);
 	return ret;
 }
 
-- 
2.25.1


