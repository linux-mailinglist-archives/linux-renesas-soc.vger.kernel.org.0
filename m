Return-Path: <linux-renesas-soc+bounces-30445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOwxAefIxmn5OgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:13:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D63C348E3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BB95301D6A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4BD32BF41;
	Fri, 27 Mar 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ouItJ04A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9431A82899;
	Fri, 27 Mar 2026 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634987; cv=fail; b=f1Lf3UHL3/OX1rKStebuGo7RrHJhvtzn2UBXMQtfFgD0jxu8FOGrmcILKe4guGPDJtngEWwjG3iw8hF1um9qyoA8ld2z9ix1imdWONLODrSKXpIJVsCknNRcD/mxLBuFK0f5CcrYkOBEAiEiBgCrhSZYwVjSWaDgipSaIN60lDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634987; c=relaxed/simple;
	bh=wKQsNH5iopp4D2JqAgujzk1CrfisAKerAqRTFfMzIIY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ggtkGG/TEoxJ+H/l8ZDosQ1tKcS4iOsQnr8UxWbDF/rCmHkts37N6iG7HOtz/woWxXC8H/95VATNhGdCuv7USHRixvwy6lb8klAEezyheODLt5qHSy9CMHWYEd/oMpefvdYlPgoDzjMI1DCRVkWjKbLQn5HdL8v2yCwnkqpO4VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ouItJ04A; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJwqakVdy7mnah4imGxnfZn7JYpY4tKpzNd8uVlyJSwnQ1dutab5qP4aGXCthdQBZ3rKSafem/hlxgNAEso4gzdiTeoLLCrm4XKeJ7q+426A1QzbP8UX7U7poI6vakfYHDsKzUk9ho1hVUFYbwVzCgowRF8+qRCVkElLINwak0n0MF/A5RpDo5dVm+yVttLJJxkwLA0OHlInaw4fLZZOniNWvm+xC77g/99FSijCI2eIU5eKFCYnM6Q5ITeLGUADSR6Ej0/fPavkro3Rl5DVmemFkXCO5Umch0GCNTYDXHG/rxv+2CZ8lflZLW7L51qfcw5elPXKGhmvWHKcUjZPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f568ezxw/l1+vFtlQ5EYX+0NIg7GoMb/iKT+GGGmbEg=;
 b=ELGmDN9M2U9Pm/NuLRNSVYw/6j4bMb7W2jtOB9cdkh5jl8Djmd2rmhM6EWwQx1K6nq/GvnTDjFG9VIF3pFyK05tGiA+hCS/k0FYitmFOlOzeMqp4JdsUJElgXjgFMzibJ0CUBdyMd96HxSwuTAYngHnhIXbImSBxJM0sIMZ12eb983gIQ+OMH6hqef6hAEqaxNxURQp13D4yfm9wKWVVjuGpdcY8nBI9p9tKHx2x95t43nfKeHWlqhM0NG2XOF8OQEFPU/99zUkn8QPGDLEOEt+pBXNTc9K4VbHqvUhAJJf2adRJFhXFAz2SsPFUwAS3E1jXhhOU2JS0inbe5GgvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f568ezxw/l1+vFtlQ5EYX+0NIg7GoMb/iKT+GGGmbEg=;
 b=ouItJ04AmYg1sxJe7prxG3e4VrSsCHCt9GbBTUkO7lzsqdomyfdM85Mm0514PJJCm6dIggM93IzZJbVIRBnzMut0t3kBDBwkSQLMfGqnWR+4pBHalVWv1wFSB81G0E+MwH2fuV+1UzZcUY/79TrTXvupstnYMbFdgwO0VWnLZnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSRPR01MB11662.jpnprd01.prod.outlook.com (2603:1096:604:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:09:37 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 18:09:37 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/6] Add USB2.0 VBUS mux driver and extend rzv2h-usb2phy reset for RZ/G3E support
Date: Fri, 27 Mar 2026 19:08:47 +0100
Message-ID: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To TYWPR01MB11940.jpnprd01.prod.outlook.com
 (2603:1096:400:3fd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OSRPR01MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: 12680d87-c358-43aa-4ccf-08de8c2c01e7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aAz/6C00ACVZj80humBk78B8Hmicq8hlH1mfNcPCuRfclZB8HCDfuDm+jWAMJu/RG5RC2sX5QSoj3rVtHA74xanOP/XHTGTBjMVM+t/ugWFklP7NRNneHCYXmF6WchiZItgLwITzATlvhcjwGf6bczBfkEBDyyoiSc4zwXGdwM19EnQUDop5tHNSLdE9h6kCJbmVmuOgIkbSN9naU4L54rIdT32sgQn88CB93UN9vAZT/WK0OPkFlhvQzHaVNWDHmh+v8PJJjOdozJFgupImP/9mkWbpr4FtjZdjB3mdW3+L+yPDcAa2NlCUPQiKuV0UTY5K85WC0o/Olnw2LXlRmZaGhoWWG+vM9GzDep5bTn70Z54005Wyl0Eou3SEcgKFhD/h3sJv6cTp0W6yupXVjdaNn3uoJ7nYrkG+yilNv7Ajt36N1lXQYaSPO1DOWUXbleJk4JTbMSPtqfU+g+88NQ8Hc1D/wMdebwDXKm0Qm7Q5153H/CJQuOUVFc5nphQ3R5SAmvbUeuHEKe3f6GLK5uFu0cqKqdpOfgcd2+sKbLyo80zsPZYKo6RHaySBkHXo9w3CNkeXoVnG2xIOrvtSbXzZT4V0QMHoQwPedI1oasyqfUyQVzSMfzCjnPAcRlaHCNFIfkLnF0nIqKkzGqvTZc/iVwFHWR782aJXtXMKQAaWj0rfN1EP3r/QB8mceENLmyX9650nqoZDfKtgkbk7D/qxTrGoC4+8jGWjhTpvwMSM3/ZdEduni4KuQG+lqrBG1o9wsNIoDO3HXCRhjDThfBqcGkBv5in+k0NqF81ZtLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U30DVooZufOBXpVHbDvvQ5O+EcCpWDhbPB18hyYtLPQqC9Sd9rQUqK3eoaAY?=
 =?us-ascii?Q?btK1B1VW//FrtRMwM4IGIzhOODxHW+E7eSj72Ls8qd+HRYcbKpKEgGSpzOLp?=
 =?us-ascii?Q?LRiKVS0jPLwy8oUArL+Fhz/Dm+pLUwjivgdQ2cYSIQ2uf2XZ+s+WlqxbD23N?=
 =?us-ascii?Q?O9hejwFxaKDRwFNYyZZVncQZiiiGvN/LjtLNBHyFpRj3+eiyqfpaar7YjbGX?=
 =?us-ascii?Q?L0enSFPI9SRP6wbLmThgjyxS4alYV4BGODZyNhjb6tjIaoL99JKq2zpKgcRi?=
 =?us-ascii?Q?nKh2P/9Ro6NIkID1IrSM+otNNCMriCdh85ZqiuL3A1r00sM318W58diC+a56?=
 =?us-ascii?Q?aEHUN6jnMyPwpbLcvXkWyo5s6VIPVgIF6l7FMcnWVcJ9CnBsc5zzVaMcogoQ?=
 =?us-ascii?Q?qRVYu67fU0THmAmfLVR6phyimEEYbdbPzLcpdhMp73v2n+grFQ9K8nTblrQo?=
 =?us-ascii?Q?4wd/6cca0kC4x7Kr8G/G+YssGP1f9ruzjBSWRy3U1EcTIOeawIX8/fMPcddw?=
 =?us-ascii?Q?hot4nYE9aIM9iC/Gs1QvSCMf2dhsq4HRAbZhhtcMa1NYx5u8AgfjoJ/80g86?=
 =?us-ascii?Q?HXT1jz01vJ/LUGn+l9xmFnjhqnX6S/8c/r6vo4w/H3z6298G596kqA864jxO?=
 =?us-ascii?Q?kKeRVdDojGIXNbHHKMRWljJQVDeX0FwGNKh8fKTUbjtTXRoHxSnmbMKIcC8t?=
 =?us-ascii?Q?CajmIFzGNZu/0/8KfaUF97n7kfQw81YohrXSwcebjIQXWr/qZTtXEvrzl2yp?=
 =?us-ascii?Q?N8qCGLSQ0RDEdS2buvaWo/ntxYKwiKtzxcpUNoYXD5DdjRjXjzAx9bgF4rad?=
 =?us-ascii?Q?mRGjmhPQefdsPHMq840TfFgVJxwU2onDHlutMql1jjsGNVubYcclYS0P24tr?=
 =?us-ascii?Q?g37NZsjDrLMPYy8fHYkvgJ6htrV2uVJm9YUWvO4sEVeBv6wxP0EA+mMAp8pq?=
 =?us-ascii?Q?mRIBZ3WEwJw1E1lHa8RjsJrvKktkqhvPeBeAdlEagdOWl23hENwJihbS18z6?=
 =?us-ascii?Q?w1rePO64Kr+ZBFwVDigBNvnGnLGxPy/Zy8IPhuChdpxLy+kzG4XGLrG9JLBw?=
 =?us-ascii?Q?f1mtqJ5LYMCdrGOQJ/X9Do8RiBKJfvSnrHzVYQPbWuJ3/Jwk8MjufC9syvcQ?=
 =?us-ascii?Q?00sJVJptiMlWIZY2sNDduZE93WZD+KOMfs1ZvHx72BFtk7XMt9p5ELfwNBoM?=
 =?us-ascii?Q?raRtAIdg93gdrNHUxrR91asYxZXwshN8GpgyHVBbCogkwBRPgk3wKP5Pu5iy?=
 =?us-ascii?Q?mfexq3IdmnjV2FBjt8/1icJOZqZzuFitCq0Ptz15AoQDBzpUdIVOZjdSkaQu?=
 =?us-ascii?Q?Oe92hDWuZLFVJrR3HrwbCHfW6+5ew2JJDEA2NTz9GoBVQ5qpp8SzFKAayYuv?=
 =?us-ascii?Q?HT+Pcgoe3zJotPzeiEj8v+ow/Bb40z25glMVCm56w0JzTEPnt8eHiIgIZCKq?=
 =?us-ascii?Q?BjFRuDwzzUL3PEijKnbabnYVq0N2/x7T0MZWaAKEUX90pnL2H6NP+3yPQlgh?=
 =?us-ascii?Q?CKxIc5/Lu55NQCLDwXaIKNIg3Nbf9MxAQ0HBZM9Cha7MmhhxleZAhMEhZ8ay?=
 =?us-ascii?Q?irLNb5ekJJNA/VI6a9jxV9qrqwaWKM/ampS5ZErcAu7WT3C5O41vnjIhzoI+?=
 =?us-ascii?Q?ByePA8BLRqcPJiRNN3jDoWzbbDCGqnuBiD7mjs7LI5QLKcuKxQZaLsCu3Pr3?=
 =?us-ascii?Q?sMbRK1/BfznnzvlyxkVCGmFis222vKamCDYouO1UHZEO28W92I7C1+0uDHNd?=
 =?us-ascii?Q?/EHYdPx0TnfwwdYG7JNr/Vlu139GXq58VNPg09J3+YFfeqclNmGi?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12680d87-c358-43aa-4ccf-08de8c2c01e7
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11940.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:09:37.6858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5O99+yFC58IE7D6j5ktCKQAefn0jQvH1zq8QMzrOl1OM8w1QL7HZj5gIkQeBICvgXWN9iqv29K+MgnatgWYHGbXcDMlvq0GcELOAou+4t1k+9t6pL7RJq+PsofF5y15
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11662
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30445-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linuxfoundation.org,solid-run.com,linaro.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D63C348E3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear All,

The series adds:
 - A new mux driver for RZ/V2H USB VBENCTL VBUS_SEL
 - Updates to the rzv2h-usb2phy reset driver/bindings to support RZ/G3E.

Merge strategy, if any:

- patches 1/6 can go through the MUX tree
- patches 2-6/6 can go through the Reset tree

Thanks & Regards,
Tommaso

v8->v9
 - Rebased on top of next-20260326
 - PATCH 1/6: Fixed driver comment year (2025 -> 2026)
     - Switch from devm_regmap_init_mmio() to dev_get_regmap().
     - Drop unnecessasry include bitops.h, of.h, property.h and
       drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on
       regmap.
     - Collected PZabel tag.
 - PATCH 4/6: Collected PZabel tag.
 - PATCH 5/6: New patch.
 - PATCH 6/6: Drop linux/reset/reset_rzv2h_usb2phy.h dependecy as the
              driver is now based on regmap and does not need the
              reset driver's private header, update driver accordingly.
     - Collected PZabel tag.
 - Update cover letter.

v7->v8:
 - Rebased on top of next-20260311
 - Updated series cover letter as part of the series was already merged.

v6->v7:
  - Rebased on top of next-20260128
  - Split series into per subsystem series, no changes.

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (6):
  mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
  dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
    property
  dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY
    reset
  reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
    lifetime
  reset: rzv2h-usb2phy: Convert to regmap API
  reset: rzv2h-usb2phy: Add support for VBUS mux controller registration

 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
 drivers/mux/Kconfig                           |  11 ++
 drivers/mux/Makefile                          |   2 +
 drivers/mux/rzv2h-usb-vbenctl.c               |  85 +++++++++++
 drivers/reset/Kconfig                         |   2 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 139 ++++++++++--------
 6 files changed, 183 insertions(+), 65 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c

-- 
2.43.0


