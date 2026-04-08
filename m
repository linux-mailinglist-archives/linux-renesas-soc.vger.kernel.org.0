Return-Path: <linux-renesas-soc+bounces-30986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF2RJ7Uw1mmrBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:40:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F43BAC06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 274FA3039BC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADF03B5306;
	Wed,  8 Apr 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sMzg4Gjx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824073AE717;
	Wed,  8 Apr 2026 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644777; cv=fail; b=M7h69FTqWy9bTQwWP9aX2LhD6bXVJXCxi8YqsYjDSm0dl4XPei+4b4MyfUM1ZtVOLIEAzkvKy6Z6d8QKXPmze7L7OW5CN1k8ohMLg3Xiw/2Nb+VgSuF+loQtB/Ewdn2qpM12lVDtrgxxIcNEHjti3G7kCz9W/X2Wd7rQEbVBgy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644777; c=relaxed/simple;
	bh=DFYD1oInR3HyxBqBT/ysR+4bKnUCEY+WYTyj3XEd2GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MfuYOxQaVgm3/wHXmUTYXRKaDGV4InPLqkWHqJFNrHi41usJQZgt9aWmAJyupB/cSsXEI9CjXDNUhGV63BJFue96fslT/dlIOqa2HxRxpWvShuJM9Dlvm1J/Ivn6O84+rusoH/+MVjyXuyUU6HKZUcSLgnY5+HgCWeL6cX5woxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sMzg4Gjx; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsdzqXxOhv0WxYmQ48KR5s8b3nLnXxDptfJ427hodfb7uaplTjzU4z+L7cSCDur+XmnlynZr4BlWnZ9wrC5qSKfk1NfgWULjsFoV+k3dvKyanyNzwyHvagYnYxiJK1jV8Bme9eB89E1iRS9RKNBIJ7snXHg4n8gSWtb31X5SEBg2b+t4iO1TwUj3iYy54O5ejgDI3tLBWZvefjJ7aHpXCcfh4cKig+GMeSpkshZQTeHo1RtepwiWgZSV2B8mCusG8bEdWNT+zMoxYfCVJqjLCjOJLYU3NOXxjsZsge6TAu3Ek56HQH0ynOws1MXPK62C6LYudNdDODwsJh6z94gB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn8EErX/EuRMvU5qgyy2ZrsKOUasKRGeQPo/l4OYZXY=;
 b=snbfddyFRP7ux1tS/qQoBnOAq0RN3fjz24kF3Sy30fhZsl+4257pt0PsTzUJBbzacP6ymScQfk/ZMre66IWAOodZeL4T1WBydf6NbIlT7+DfZu7i5xga3+YA32oBVRUNy9+7DWvcotd9cS7DEfaWYhGde5QI0t/bYpulHmkS9ymXAyvUXBbIAo3DVaHvcwupS8nDGRipstGOsaY6CGJuKdMZ7HD3x9mYj/SleeBqciwvXkClhOZSXk/4GJAL9MpJuYAR9syzUhOBkZGgHfGKOaKcpcMvhcbZemGKsyu0Vs3zbMaU+MLN8N3L41WIlBHa7xzucsNsHD++UaTHPuPwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn8EErX/EuRMvU5qgyy2ZrsKOUasKRGeQPo/l4OYZXY=;
 b=sMzg4GjxJli2+OwU0AVsAN/+8Sd7A6niZ5X6MjL0wqoyUv91ENAaPsqSOBQTj5qn1IanyPKM8v/B67wJo5Dy39AJFrumzQXyoWkvxiTLOSbL1mY4T6OgmL2Q5vqBgm/0MMzSIyv+8KVa59jwHNgXjsdiqPWkQGlih3+aAinVdj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYVPR01MB11293.jpnprd01.prod.outlook.com (2603:1096:400:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 10:39:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:39:33 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 13/21] drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
Date: Wed,  8 Apr 2026 12:36:58 +0200
Message-ID: <9e0f64dd5e1efb0d27219416121c91a19da96ebd.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYVPR01MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: 17669590-5d6c-4217-d3b7-08de955b1f6c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 atszNCHaZRdj7PaGLHvKodhcjTgzFOrPcoZd4xKEcLThPHHalrVRqwD4gkGgKX1iJJLqaYOFRd6c9VgxTAtya8rvpk+jA9M0vnTi4taUQBciPY1Kv2gBBUteJl7GsqI06Y0ZqLlf8GLg4kkhDabYcRBNXSJLVOeflUjTGsUkYG13hPuZY+dr/sDs3geMRSX11WS9zx0XTg8a4LIIFEWeBYDkQ1xwzQjA2IDO0SXdyyr0EVoSQHQcUAwl1ZykDlVV6DzrwT87X+1MkBn5VZ+HSill2WwXhR9KFDDc/oQsQXSmK+EmspgPnKRwZ2X82u77oeOrYKmk+Kh6YMUvQcbfPexD+O1XfZtidBg5UrwDEV6FUa9gn9V/1nenW3yU9A+pbQ79LfHtIfg5/xBWSZ9soVN8a11hL9xT2TgSnrSFJCRbkyRpL9kexToVLh/F9cnJ/8MdAm/mJEvRZeLxdBDp5yAYcUMXVFmYVnjxodl8brMxW1ma+xgJC79tA8gvgLwpMuN+a5k14MJQySnYvQarUeuauaUXLCIxe7uaw/KuoQrYQ44vjs64k/DhkddS9ZTU/u2TaQru/5zoJnrS3PJ3LQBNNM5zvulDXFtgkyEqfdNcnSrHZ+olOqOqxnRUFCsKa4zjzw9IRBIMqMRhiBdsGvFeyHeO+vPwU6Z3V9laW8R2vjElPCzDj2Z1HRVbMWFU4d3izCuiPL6Rf+HfN6/HoypYhqeqmvOPjHR2puqH9AiXBQ6rllayMghdq6e0QV9W0i3gpXAyfAkVS6hn9yMy4bSjaNMopOMk2acP9BO+X6k=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kSh88hof3sOi/dpm4YZ4OJ4Ibv0jhTCegjX/9c083f8j87WBAEeXmVrcsv9Y?=
 =?us-ascii?Q?AUIIcQrvMPUzxYX8TsKoJBC3USPb7LSMPrz9rRuQyofIwbRZxukD0Na6gVzG?=
 =?us-ascii?Q?GzHgNLcma5lXgl6cFpmXnaXrmd6xw6WbH9eW9vPwLW5SCVd25qr5DDTDWf1+?=
 =?us-ascii?Q?kOyvsdL0igMqQq65PQAymYAuCuY3FRBJ/msijkyajQGEhqIXVL3tjcZrAYto?=
 =?us-ascii?Q?be0qg1dkJBYgwRdcpQ/J2LzV2lXuoRr55V2GN720qJcVUbHJ/SNgC3AEoFy/?=
 =?us-ascii?Q?Xi8s330z+eZa7uCfi02ALmAYCt457gP1xgdynY8Cz3IADH1TNZQzucQHFJP6?=
 =?us-ascii?Q?qHFGatNW/gPyuuN4q7UNREHsdCq0IWIs/rqQsnheRZ4jh6dNK015XIf4cCfQ?=
 =?us-ascii?Q?HnVv12tzkyb+/dOEqYsYCznmHk/WAmhdciyo9FpXd20nmR5sXtpITGXcf7p2?=
 =?us-ascii?Q?st7DCl+1ZLPTiCSHidTDeTIPxtJsWAGKlWH+YHDTTYCuWjknyDnBAJkiblR3?=
 =?us-ascii?Q?XyQ4zyKZgh5BVrAwq0iGQGIyRMjaeVaUQJGExsEju6uZEUG7FPA9wT7dpfJL?=
 =?us-ascii?Q?yJNKto7qfBkvUm73yuHAUMQTKTinSVjVNK1AiEzUaocITcLYyOTZVw0qtlgO?=
 =?us-ascii?Q?iyPWyvxly6wHqkfiyDU3OFuxL6znAjSQa1qUuwQQcET1EPFZFn8k2THuQy9l?=
 =?us-ascii?Q?jvVPFReuapuaEKg+tmdkic5TVyU5mrMrVIVP6HeqhhPd0ycc7C62Hr6MA3cw?=
 =?us-ascii?Q?gSNrZLH2cRD8j8TXK031IfnW9siCUXXfAGbTo9qERxWyl2KmVZCdVSFHNNm3?=
 =?us-ascii?Q?eNjZOFSY3NctX3Q28Br1dcBBLGXApw3B8Od67hcvJyGWtoQNfOlaDdDcp2RD?=
 =?us-ascii?Q?EobXDmNFmO7zs9deWIOCVHAnSpvNHuXfK2zH0ABOM7kLyUhShB2pS/EXcnm2?=
 =?us-ascii?Q?6BGG1PTXrHGSCamKVANnsrfO9AGWVFS/hmxjwRyQzmQSkpn7QGDcpsOXBwjt?=
 =?us-ascii?Q?GvUojuN8Y+yC/ZcAuU1oekq9HJxVdXRvMsOJx2K5VXmNslf55LUleXOu3UNm?=
 =?us-ascii?Q?fJrhAUTNmXcBYgJCfyGPDzNJ3nY2fG+MEBLxSCTwoVmnmtrUdvpSpKMRjVMo?=
 =?us-ascii?Q?j7eKZHCAa9exp7/Q75d44TEcMfaLk7gW+HNivwPS5pIz/7iM//AuNhPjUrCR?=
 =?us-ascii?Q?b3aeBdGOymdM96uN8fR9cE45AM0+UeedjRdKdLvFQJ+Mh2GtWOWXALgZ6HY5?=
 =?us-ascii?Q?nnug486PcP4PhWCWux6myKGVprCjLI7KGN9BGfxG2MmGahI5pfjiyfnCDocQ?=
 =?us-ascii?Q?RfRUYr+/SYcAaNyWCdEsovPoXs9wqmDcMe9JWYVYZSepy5sR+C4ZmN3WVYVQ?=
 =?us-ascii?Q?HjpVErudx9q07JAiRiMt+LHP+YkUEuQnpeoPwJBv1fT/oeIihVcZbeUe2B/F?=
 =?us-ascii?Q?RHuf3GuImE5/LFJVf+mOUcon3bQLakmqROl9B1VJqR23jOgSptWpLCneUxg3?=
 =?us-ascii?Q?8vNWmplPNncaFlfuFCGPUr8sxJCl5TsTlNwAG7cwPF0yyiiK2NoVNMFpmLOM?=
 =?us-ascii?Q?qATvT4U3IAVlLBWULzHvmPGeEaimOnYAzNLDrFuSjT22EnoMxfRfYHvn0HWF?=
 =?us-ascii?Q?qqR1IPFzk1R/rJh2UD1e6sEou/l6oF9kfJ43R/D5YcT5gd5tOHw7t3l3vNZM?=
 =?us-ascii?Q?ul2+RqzISyV9TFXasBe/pNMoEu9H+4KW8fNjxq0mtAnx36tEtvZK1wL25Me2?=
 =?us-ascii?Q?XVa82BLHKH4MljMnQHK4eY7AyOlQ1wcWSxo8K5kNUCpwLt1zaK+i?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17669590-5d6c-4217-d3b7-08de955b1f6c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:39:33.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/cfoxuWsRyuYqx/wj4qo6XSBs4W4ho2LB0dDCgWqDcO10T/dUazp/xOL+TQBvF4rfdC15q/qpyOfMP5goJcQPGtD80Wx3+x2/fnZGNiY4HX9nJ+MKxt7HigBbNV8203
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30986-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 449F43BAC06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
based on the DU instance actually connected using the GPO0R register.

Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
the code accordingly to manage the vclk selection with the introduction
of `rzg2l_mipi_dsi_get_input_port()`.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - Moved rzg2l_mipi_dsi_link_write() into rzv2h_mipi_dsi_dphy_init()
   + comments from HW Manual.

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 71 +++++++++++++++++--
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
 2 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index be6dbf19a24e..947c8e15fc4b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+#define RZ_MIPI_DSI_MAX_INPUT	2
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 
-	struct clk *vclk;
+	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
 	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+	u8 vclk_idx;
 
 	struct rzv2h_dsi_mode_calc mode_calc;
 
@@ -543,8 +546,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	unsigned long vclk_rate;
 	unsigned int bpp;
 
-	clk_set_rate(dsi->vclk, mode_freq * KILO);
-	vclk_rate = clk_get_rate(dsi->vclk);
+	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
 	if (vclk_rate != mode_freq * KILO)
 		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			mode_freq * KILO, vclk_rate);
@@ -687,6 +690,19 @@ static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
 				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
 
+	/*
+	 * From RZ/G3E HW manual (Rev.1.15) section 9.5.3 Operation,
+	 * 9.5.3.1 Power on Reset and Initial Settings for All Operations.
+	 * Figure 9.5-4 Power On/Off Sequence show that after writing to
+	 * GPO0R.VICH register we need to wait for more than 1 x tp before
+	 * writing to PLLENR.PLLEN.
+	 *
+	 * Note: GPO0R is a link register, not a PHY register. This setting
+	 * is specific to RZ/G3E.
+	 */
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
+		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
+
 	/*
 	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
 	 * (C) After write to D-PHY registers we need to wait for more than 1 x tp
@@ -1005,6 +1021,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
 	return ret;
 }
 
+static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
+{
+	struct device_node *np = dsi->dev->of_node;
+	struct device_node *remote_ep, *ep_node;
+	struct of_endpoint ep;
+	bool ep_enabled;
+	int in_port;
+
+	/* DSI can have only one port enabled */
+	for_each_endpoint_of_node(np, ep_node) {
+		of_graph_parse_endpoint(ep_node, &ep);
+		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
+			break;
+
+		remote_ep = of_graph_get_remote_endpoint(ep_node);
+		ep_enabled = of_device_is_available(remote_ep);
+		of_node_put(remote_ep);
+
+		if (ep_enabled) {
+			in_port = ep.port;
+			break;
+		}
+	}
+
+	if (!ep_enabled)
+		return -EINVAL;
+
+	dev_dbg(dsi->dev, "input port@%d\n", in_port);
+	return in_port;
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
@@ -1425,9 +1472,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
-	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
-	if (IS_ERR(dsi->vclk))
-		return PTR_ERR(dsi->vclk);
+	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
+		if (IS_ERR(dsi->vclk[0]))
+			return PTR_ERR(dsi->vclk[0]);
+
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
+		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
+		if (IS_ERR(dsi->vclk[1]))
+			return PTR_ERR(dsi->vclk[1]);
+
+		ret = rzg2l_mipi_dsi_get_input_port(dsi);
+		if (ret < 0)
+			return dev_err_probe(dsi->dev, -EINVAL,
+					     "No available input port\n");
+		dsi->vclk_idx = ret;
+	}
 
 	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
 	if (IS_ERR(dsi->lpclk))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 2bef20566648..cee2e0bc5dc5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -83,6 +83,9 @@
 #define LINKSR_SQCHRUN1			BIT(4)
 #define LINKSR_SQCHRUN0			BIT(0)
 
+/* RZ/G3E General Purpose Output 0 Register */
+#define GPO0R				0xc0
+
 /* Tx Set Register */
 #define TXSETR				0x100
 #define TXSETR_NUMLANECAP		(0x3 << 16)
-- 
2.43.0


