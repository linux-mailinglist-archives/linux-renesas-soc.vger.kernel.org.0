Return-Path: <linux-renesas-soc+bounces-34567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id roIaI5nSQ2oZjgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 16:28:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EF6E56F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 16:28:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=XdamKDub;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0665308E45A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 14:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9020426D16;
	Tue, 30 Jun 2026 14:18:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3653ED5DA;
	Tue, 30 Jun 2026 14:18:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829091; cv=fail; b=N11eePnuuQQ+8bHdAiqq0HMmMDKAqiaANOOiytk+kodrvC2LKTMWMrl2EIpZ6/nn+lqJeUwrnkR/WH7Y+L00sRtFtjKhb8Ty2Ly49q/lSRX5n7CeRkxEUzy6zzK1UutjNUlahYYKX5naW87FAodbB/vsS9CJlYfpYsbnEwjyIYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829091; c=relaxed/simple;
	bh=t6Lik+BD3NS3ljW3Zw5iHzpv9Y9dLaXYP5nQYP+mV5s=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uKvX0unuOamz+mj9BHX4eu87Qm3gZKoeViQlRm/ZQ6cwqXdZLVxq3sdSbT+reufROOB/+/87ztK2pLm/UnVhXXrwaTkCfy2hz5ieGeYuuaGAyvwXtQnmi/t953ccdOTX9i6FvtCW7iU6obDsICPPJ+PkZn7D5+Z/8kMUHvcqDJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XdamKDub; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r66ig/XolSxqFs4aa05gaL6bOo2u+9Qb7Y/U34hi9G/EMO7tc81uYoATe/CiduuU2sfL6vqysPVnA1dAqqGY65FvanM/ijuNpwrGGqdJ3dhRftlTbHEIXGp97b8S92TKLtM8Hia4Ir1RBsPJ/XZUtX22EdmkMt8QNPhj/D8TAVBkN61dcz51iQpKbhe1vVd1qbWarvJhBeAw6JerqmMpNZiMvUCuRaQYdb9ReAXQHPLsT6PkEOY/vDJr8++iFHDHJDqBmqF9w6LOln8FqJU9pMEh2kT0RkrvfP6JAelSWIWGviV7gxz9Q91fpIqR/HljxAIl21rAWk2ZcxfElnk8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns/9DM86ZnQIUdoXkNyYdA3E/J7tAshOnLgrjli/6Kc=;
 b=XcBifLV07Ogrj7OIkyfnThltgC4hGFSafUKJ76cUf7LNyhAfhPM8DgTMX6LSDl6g/J4PCS98Z13F972XzreGuwLFlYONT6urpyTDSoKpPdbxkKcZ5O0fpuDcsxuvw6hWxnXxMa3mUpPZKVGB2cb/wVZOWiLeDZMrpOFC1C5elOhoOZWEvkJqOca3ifGfK7y+r3bqj8v/ii6+FBlUtTs7UCQo91kQLQJMTnjsWghHaDlJmw6SEa/hHW0Hflk0JydnHKpFj97CoTlGR8mxhs1GM8pHNJDTaP8GDy5g3w2tH/n+S01i7GC4kWPUGfXMYTkvCVKQwr71IWkUoKT+cafbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns/9DM86ZnQIUdoXkNyYdA3E/J7tAshOnLgrjli/6Kc=;
 b=XdamKDub9ktMxGam7+TtivV/Z9SVfP1UBK52vOEjPUdizXWSKKbKxhWClrH8e4rm1NoEigsfydZwQRG3qb865IBoN81FZpA2+zVrVHzoBdYrgRcWDjAam/776mFKWdR8QKQx9UUESGu3HfMRwkyPUpj1CPnVKFOliTu9BHNWLjs=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB10388.jpnprd01.prod.outlook.com (2603:1096:604:1f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 14:18:04 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 14:18:04 +0000
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
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v2] PCI: rzg3s-host: Re-enumerate the bus on PCIe link-state changes
Date: Tue, 30 Jun 2026 14:17:20 +0000
Message-Id: <20260630141720.3938514-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34a::16) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB10388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f540ba9-a10d-46ba-e962-08ded6b2660d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|18002099003|6133799003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info:
	2kkfXE89f/jQ5WwTDgIUxEz99ElR+ed3XzEWQyNswBzPf6SP2xgrSWY5B48I8RInBPe1XWLQTDaLTxL7z49fz5S6DM87RS2UFpvzzVb6iYOhBk7IST/VDIAvbixi4HgcE2GVtv2jImV6lH+l25j0OCYC4wMbuWFwq3Dd91wzsVdvL3pRbO3E2ioAmhGCUSPCmC2jAINbw6M33TrHItqnESDtKVOQTCvD7mYvGC09iRbTeiBP4D5VSyu4gyljiXvgPkwSrgeFqLcqQocLCpCf26Nn0O5B8at/SPo81BVkaVvRSByui77Z5/Q1XNIolq6rTV/mO3enJOiPWRLLQM2wXtk2h6ur8ylTifUIJ6iCeLVTe27UhfMbGIXpnFkyyP3YSlgVEuFGka7cyF7taScEr/SzonAYW5epzpk6lWqjSLosPZz8q3S5PBA7wMPK2sIQlGIkz8/+5kARZVJV0lOrx8CMNpiouYlnQ+suwzAu7KAUaLDMGwfSZxGzEpjLmtSeHORklDaluP0spXB8FDP83LqaFefn5rI5CdyTrhGZdjx66nX7l3f9BxcXEtMtuXjXPNatGKDgUxw4EP0z82k2aoKupGctllOXEa/vLgFhvlMe6f0cuJYNxq9Xoe6cwQOdObUNqQ/oM3YqlFuZgy6mDPDWu2qJsIPL0q2JszGUZdkT1XsOpBc7LvBfKteMiIAbFgBzt0A4/MmIswhkSilc9bZYnm6NsdTKrUXIHPVqVeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(18002099003)(6133799003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/JOG23X8SHjOivXgaFNL9ObeMxm983azdvjt1cah+YSlV+sB3JAaZZUicsmN?=
 =?us-ascii?Q?/Iz3yOspP1DndZvTVPfHUwOloGkp+T0iCppHmj7xoNcVNAar9iJ/5vE/+jjx?=
 =?us-ascii?Q?WFpAdTFVrfRAqTkVs4NHQVmddxMNmGnfq+2fw7RDSX5VchRE8daNTx4iNrCe?=
 =?us-ascii?Q?eyp2+s6j0aXhgNY3+ZjFVUVrISWGqIS+azBytvt18/ZRGyf21ffhg+ZdwzU1?=
 =?us-ascii?Q?SyLf/EzMrStoK++gHq7oiNnIRO+i52V5+hcPU91vPp6TN4YhORvzAqKm+FnG?=
 =?us-ascii?Q?9zaZQGqhMOgL85qqcdwGt/gNeGji88001U/qEFTB+FjLgXDw51ZnCC41f7qd?=
 =?us-ascii?Q?jsL9i+OMUARVrc2Svv5xXO9KF4LlviANrFy+/zgcBFWzHXKZZUcrIvPK45Aa?=
 =?us-ascii?Q?UlEyz8B4kuSweHWqHW7jKTCoB+0jiPNYS97zH1fedFXhtZuxsSMGDtC/EsuZ?=
 =?us-ascii?Q?m+jD1RDgqEy4Cu/HNI6UwMoSABs4fDAEsPUtjF4fFRQdlNIVgNMych5wx9D2?=
 =?us-ascii?Q?LK5a0tH6MCqIwfC+zMrDDVrfSuDmBXqWG9nx+HHo6FlyCnMQEwvvxPAya3bo?=
 =?us-ascii?Q?Q5yEPDzTmc2C3T4ChckpmIq1dO6ADGMo9fo5qeu0Hb4+vYYAPvwrHhrEKS65?=
 =?us-ascii?Q?L96EPvWqpEg6vMnryumngyKQhujsohwlTjXFwryHFQWbYlhSpNZxWWeJmSiB?=
 =?us-ascii?Q?Fy8C0JY4fRLRlL2Fh/jusCz193oHHyy65XAtWJqGthK18MlWTyyE8Zho1E95?=
 =?us-ascii?Q?8Nlar9OTOArieSX698altYm/zBDANVZZBVR6xsiU7ooneJ7pZIdgdfb2Iwig?=
 =?us-ascii?Q?5v9xP3pnR57IFg9zmmPq0ZC02eoqSkZqDWZXiEhPxLOnY7Uhvk5+DwX67liY?=
 =?us-ascii?Q?fO3ghCRcpMUfOr0bYWUa/T6TBdY+cki5mgwjKa46INIZgQ1FHk4X1qQckP8B?=
 =?us-ascii?Q?UTTwoUhgQkBdaYDRoe7paoez2lD9s68Sbt22ESKmUKIRN9K4ovI21ATN0VV1?=
 =?us-ascii?Q?ImlMyj2A0zW7ujUMIF+CXQ3ugZIh8yYw2YC3Ky4Ct3eZ7+souicbEE77OSRY?=
 =?us-ascii?Q?+trXQ2mXr2bCPAW8bf49fwwJ5PsnO14ix0GpaTSpWkVgvR+DKqHu/aUFKGjB?=
 =?us-ascii?Q?P9UzTu4WCvGR0/DU3oFjedXI1HqX7RK/yoR2sGf+sa0EGw3zlYRpq1cDxgzE?=
 =?us-ascii?Q?nKLUMHftQ1XffkkcwGTFeL6gvWZT2ZQdQtbvQ+7dOCGflK5jI2zF324YKVFT?=
 =?us-ascii?Q?qfHsvDXKIYYCzVXDeQKqKO5V0gFFE7TkhAkoWLNQV9rcJZiDShdbVJcbO2i3?=
 =?us-ascii?Q?whN7o6iANRYTHT9v36k+nj2TFcxD6iiNq3MDvNWip9o4cnKykRvkAb89dnpT?=
 =?us-ascii?Q?wbqy6qEA532J2mCIStO+92/ihUHsGtdpGJrFTTuGtmav+lgb+kk3GdHntxJF?=
 =?us-ascii?Q?8Pgu6F7r3PV0dvEyPjA4KSGvDDfp7WOVCuBucGzFp34o4hlWz9Mlgf10o8oz?=
 =?us-ascii?Q?8Yjj9GH/mgeboohZ3dVigaJpzYdyzQ+2o1xHE1w8MLtHYNLEGFyKlgNqIWco?=
 =?us-ascii?Q?bz9r+bwjQ0dIf9zraavOjFAEN0aqV+EnPRjO0EeocmdFSMAEHLjCAzo7kKEt?=
 =?us-ascii?Q?D/fqz4wZculKHs7Zx6Q0j2GgI3EIwYJv4DiYCWWG6EFj6OmkZddcxCIpBpvc?=
 =?us-ascii?Q?db94NhJpMnB/DRc0qLd712YB5H5rukq5oIq8l3BGeQTANsSh49kIZXahWThH?=
 =?us-ascii?Q?CRyT0FxvhTyGC4IkfpFJzM6HOEPvbXg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f540ba9-a10d-46ba-e962-08ded6b2660d
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 14:18:04.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/qF44xukt2Zd2c6JlVQ0zROcDi1rpeyDIdPD+5bznB8hDShCybyhdTR+AnjSmOTjvVUI0PAJbKEGdlC3zm16uOzAJECTP1aGZD7WSk04ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10388
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34567-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea.uj@bp.renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:robh@kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:john.madieu.xa@bp.renesas.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 829EF6E56F5

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
This patch applies on top of the RZ/V2H(P) PCIe series:

  [PATCH v5 0/4] Add PCIe support for RZ/V2H(P) SoC
  https://lore.kernel.org/r/20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Changes in v2:
- Rebased on top of the RZ/V2H(P) PCIe support series from Lad
  Prabhakar. No functional change.

 drivers/pci/controller/pcie-rzg3s-host.c | 153 +++++++++++++++++++++--
 1 file changed, 143 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 8187a82..80e0c0d 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -34,6 +34,7 @@
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/units.h>
+#include <linux/workqueue.h>

 #include "../pci.h"

@@ -322,7 +323,12 @@ struct rzg3s_pcie_port {
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
  * @controller_id: PCIe controller identifier, used for System Controller access
  * @num_lanes: The number of lanes
@@ -339,7 +345,10 @@ struct rzg3s_pcie_host {
 	struct rzg3s_pcie_msi msi;
 	struct rzg3s_pcie_port port;
 	raw_spinlock_t hw_lock;
+	struct work_struct link_work;
+	int event_irq;
 	int intx_irqs[PCI_NUM_INTX];
+	bool hw_initialized;
 	int max_link_speed;
 	enum rzg3s_pcie_controller_id controller_id;
 	u8 num_lanes;
@@ -619,6 +628,30 @@ static irqreturn_t rzg3s_pcie_msi_irq(int irq, void *data)
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
@@ -1151,6 +1184,47 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
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
@@ -1268,8 +1342,8 @@ static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
 		       RZG3S_PCI_PEIS0_RX_DLLP_PM_ENTER,
 		       host->axi + RZG3S_PCI_PEIS0);

-	/* Disable all interrupts */
-	writel_relaxed(0, host->axi + RZG3S_PCI_PEIE0);
+	/* Enable DL_UpDown interrupt for link state change detection */
+	writel_relaxed(RZG3S_PCI_PEIS0_DL_UPDOWN, host->axi + RZG3S_PCI_PEIE0);

 	/* Clear all parity and ecc error interrupts */
 	writel_relaxed(~0U, host->axi + RZG3S_PCI_PEIS1);
@@ -1435,16 +1509,21 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
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
@@ -1706,8 +1785,15 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,

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
@@ -1716,6 +1802,8 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,

 	msleep(PCIE_RESET_CONFIG_WAIT_MS);

+	WRITE_ONCE(host->hw_initialized, true);
+
 	return 0;

 teardown_irqdomain:
@@ -1803,6 +1891,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		of_parse_phandle(np, "renesas,sysc", 0);
 	struct rzg3s_pcie_host *host;
 	struct rzg3s_sysc *sysc;
+	const char *evt_name;
 	int ret;

 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*host));
@@ -1880,6 +1969,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		goto rpm_disable;

 	raw_spin_lock_init(&host->hw_lock);
+	INIT_WORK(&host->link_work, rzg3s_pcie_link_work);

 	ret = rzg3s_pcie_host_setup(host, rzg3s_pcie_init_irqdomain,
 				    rzg3s_pcie_teardown_irqdomain);
@@ -1893,8 +1983,39 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
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
@@ -1924,9 +2045,19 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
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

@@ -1957,6 +2088,8 @@ config_reinit:
 refclk_restore:
 	clk_prepare_enable(port->refclk);
 	pm_runtime_resume_and_get(dev);
+	/* Controller is alive again; resume DL_UpDown handling. */
+	WRITE_ONCE(host->hw_initialized, true);
 	return ret;
 }

--
2.43.0


