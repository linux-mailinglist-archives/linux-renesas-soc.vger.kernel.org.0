Return-Path: <linux-renesas-soc+bounces-30206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK4zM+Ckw2lhtAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:03:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC0A321D49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 057CB3015FE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 09:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD1B322B8B;
	Wed, 25 Mar 2026 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tn8oRaYo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B216175A85;
	Wed, 25 Mar 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429381; cv=fail; b=eASfCpAZyqRtar5U5+UZGgj8UYydH5jn0nGfqqH2JLRF2fv672hkKo4L9V6+j3koloeFrUJ5oNLwxvzHqdByNEGxxmPUW3ec5BU5qot71blJ1O2LlulbuFfMpSUCBHGuZYpEQ6pL27rtHiWnrJDDHjHiNLTEH2ON6XwiFv1Clak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429381; c=relaxed/simple;
	bh=dbRkxOc8UmIH4NsNk6JUyo3QSJoc4k1BNJDlTz0U5vU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QVW+cYCnHjVxeq5G2f/zjcRuAtfGobE601K3abH+DhgnXiN74msPpqTUd7lOJYfo+h2YYVJ+wiwoIJghy6dt6a8+lFSY9O1N9sloagzlqefl///DEbBmps6AFoor0c/AT6lGqVb4KJu7BCsYFfymV2pvg9NbXPETJ2dTqImE2HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tn8oRaYo; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDioeaCAXdTz7lYJmGWG5S+QNjt9hm8DuVzrMIjVMQDQsmXg5nIVSGUtZ3GAlIZIB5MqJ6ZK0gnzXUxWsEs8euZdPiIMJUcLgvWQF0zQNhscdVTgIMFppRa8Iv6RxQp6hmz+50mRJ70KuVrCL7FwLrZyTZ+7YUSnAu9qA64D6eSWhiRqi/rnc9XzceKeMrXSCZB3FUq47kfmhF/EQFDnMdj5xbG9ntE4es9CF925wU9MPxqFbTeP5l/UGYYYkmkcgbjMK4mfU4D2r2nGIbSifDrp8YjL8Mh0HAvbODGTrN8y6f+RbKDFXdOjwfSr+zoI2eiNpsCwpJnRrRlvN3vSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntIBETCisf/2+CHmlpJgEn3j3nVPZoX1uJDqhhyMgaI=;
 b=gHDayBVmgdVR5haom2YGp8o1EFWyRKf7dCKXN0L1YcwqiTlu/wbT/8UNbr3j+VxaoLcGPqxiP6Xk2lhdjionKwXxagzu5w+rTejMhPXNl6VTeIPhPZbLsIZ3hqKMPnMzvzPHCukeR0y0a6qt8zmHPUbrCvu8v5oT2g+RcPuyewyhctJtvwa7JbaCoqv5SDc18aDJ8kCz6LitNUtKPrLqlud0it6Glc0U4w0NBOXluP+1wQYgOX10+0vV1DENYMI+BQSpK9C8L11w86riraJdwh916B7gyIB4SoqwCeEI7zBgEUO0NCeFzH5sgaOxTSa8+TaxS5V3os/H6opj4/vbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntIBETCisf/2+CHmlpJgEn3j3nVPZoX1uJDqhhyMgaI=;
 b=Tn8oRaYoszlMX1od2I2vQsEqqxjBwTYZbZA6fXR1eDzxtU+lM1g+fHWOwYfDn3J64wPPJ2hCSS3/eySfDZrInp6eEPPNH9rnfjDV73mbq94WMzrQX/Wa2bIwgT+BNUxTS17FLWwEPszDT7w/e7tGZXZPhMFxIhBX0teL2JOEYCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYRPR01MB15433.jpnprd01.prod.outlook.com (2603:1096:405:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 09:02:56 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 09:02:56 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH v5 0/2] hwmon: (pmbus/isl68137) Add support for RAA228942 and RAA228943
Date: Wed, 25 Mar 2026 17:02:06 +0800
Message-Id: <20260325090208.857-1-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0027.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::12) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|TYRPR01MB15433:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7f27b6-7a45-4421-5fc8-08de8a4d4e15
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kFAmaho1onqWeyfJsIJrtWFnKJX/xOxYYmBIIBJVzA45Nzs/mPaQIkdRjLZQ4faH6Agfv9HpAV+fzhqwKXENhdsSO+uisPGHNvUcAG1cDPVhNoa46EfmVs5UJoIjqeVzZuCVIGLOkDmBCAv/N50yovVr5O0KTLfLaRIANHZ9mD/sdyR0S6q3QXkE8dxlRfYZC2n0TD3WbkYO9bTmcl+rykH3yq7fzn4hD4UH5Xv4hU3OHbdgRMkTuqNqbZ7W+QsMvQ2GK2BWbZMEyONGu6DKPR9qtqmRzeueS/OD4ngls8sIqwRi5mpTwyGW4zohsAWOpb558qYpMUDfO6c7b9UD090lmmoEfnuNjpd+4kkH5kl4TQidfz9b6zTlzx49BHda+s1B04AebextAcsStwdbaKCoG06iOKvl07Z6mLBNGVhRKhK+z4tJXby6QkLnoEbPJs5baFZztQUlCKlGZlHEG2863PmdjPabCi3A0aeVjqBhLr9MqwTHvY9tt5iYBxsRAf8kbBt9o0o57BGrI8nBTcJ1R6kRc2nQ3WR9wPvWnlJTq/myvQfHSH2241PTLZzerp2XkYXRNntC8DPPtdtDAuwmq637OW8EkJrrVev3mloWRGc0iAXIPfUVvnkDslPQGtjiiWqUoqKGBkVnznU0dEzS3FCaPEn5tru8vdza3XnzW4pobfoYnv5ExsiyneEI35u4MJpjNTUoSbTHWoLc+A/P+/B1cO3I1huVMVsT9tKKCZvAfYYkP/S/3zeDGoebCnqInoo7TAZFVgX08+KS6gjl/xugLSm/E1rv0713ZNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fxmV4LYi3JEUlsufYZq5fSKyIlgF3WEEJZ2WFtD2n4bBNdqp+lpJkD/A/0RH?=
 =?us-ascii?Q?KmX1QJNEGQgjdFAyddarcFRKq4VquW6wZDCLNVw+YqzLefFawQXIhmzvEfXz?=
 =?us-ascii?Q?A0UEoC8y2WKi6fF9uW/T0GBAQbL1BgzkotU+Qa4AOafBJU92gUNCxE+9HAzA?=
 =?us-ascii?Q?/mf2pslz1SP+Q57WquKCEWXJYFH+X94C3tC1MdaemWjn6p2ZsDAsXfFf0TBg?=
 =?us-ascii?Q?pGJaAF2RFCTt+jHJGZQxxz5eyeGIxSIIm/JxgS2aGDq2GYtxL+RGVWnOyzXb?=
 =?us-ascii?Q?vNXkoWxmLxbOzqxnSjZW8juxyE2TpFJjswWUc0A5OWccgOpG6Gd8V+LfylqS?=
 =?us-ascii?Q?5U6JaJBONRYbuFWI1JzkRQEC8XX9oq+Da1Ue6utwwjHomNG4YjAYgRCcq2VC?=
 =?us-ascii?Q?zq/TDrpMFyuAKPv+JdaJkJVEEh36XFbNIsjp7QdZsbJxoeoKVy/7qm8EbAqI?=
 =?us-ascii?Q?dHNqm/M74Cb9Ykzc61hqQcGjVJ7DLmpClj814D8G5OwZsiWJXhCv8V1KAARh?=
 =?us-ascii?Q?8Z3RF/ViZHCphOzeNwFiOF7BxJ4D/b8lPlrz2lkmWTPVu77D3r6V3yaNL4Ul?=
 =?us-ascii?Q?doKzFMMRg7t1SvG723S85ZApL28N/7GPT7r/Ji5/QlwKxX8TInEk2rj5BjeE?=
 =?us-ascii?Q?cjtxOdhaCuwzYfo/gZLsF3nXLx0wg7FCQJs42CoaZmqqMLTtr44Mh0f7ABpU?=
 =?us-ascii?Q?r1gATa7f+qSTD8vyjXaCPIQKVxuiwPcdmufxMc7wZj+hutLPiQiF+S+a8uRt?=
 =?us-ascii?Q?BcE0hho6f7VhTuOdI4ur8QZy6OynkzG8UQ64Yozn/aUVWHI2s4IYZxfKDKv7?=
 =?us-ascii?Q?BRq8A19a6Iv8cx7K0kqP1amGrSxXEAM2RXET08JnDVHMkPhxTIjaGlkn/2gI?=
 =?us-ascii?Q?3aXJv9nD7tXWqjOHtxmTs6vsBRMkoDtsk9vZ5QO+sknfKlXeQuW5sG5xxQLf?=
 =?us-ascii?Q?LwWffYbdcVrozM4HN4DH6v/dFwkzH1uqIbksSUOgpZTbc7coOOZCnUOPVYKr?=
 =?us-ascii?Q?t1MavCUEp7GGNDDYctYMolhPOunfYrRtbetzuBBt/f93qCN9W4AcYWU7UvAK?=
 =?us-ascii?Q?Gv2CT97tCkKqpIwSJSNkQcq6ioJwHybEarw0LrUggNo3iK2oCsvZWPtd5KbX?=
 =?us-ascii?Q?r4zrD2Cy6W1h/scdhAdV7/fImEaC/sGMMGy3AHE8ZKXHHQINClHqSvSVhQ3C?=
 =?us-ascii?Q?QR9WQfp/2Vx6ZJjN5JTqA0HFOb5ZRkjy+UxE/MkdLjkryUQEX8PxlW85ufMN?=
 =?us-ascii?Q?IkElhS9IH37m2syopYU9y14aitob+HCrK+Flo9WuODifluot1q675J7Lqi1m?=
 =?us-ascii?Q?Uji4ZySxQ/QayhV0dHsJQnG+A39V2T/JgFTppleYJ7HjqK/j3YH0hARIWPbG?=
 =?us-ascii?Q?S8mTTJPusSm45q3WIC5EFag1CS60R6KSkEGst7sdaOpbzTHn9mMlZyz0vNbm?=
 =?us-ascii?Q?T/36AUfJl074fIaZPYns1jq2QzvK9/EnFaDXDaflLaCRlN8vaD4CZ/f2NPiB?=
 =?us-ascii?Q?CZLJ5wlvt2TXEPfRbEeh3Fo9gR2uUoKS6e833lL7MioN0yTD2m3YpEWwHXss?=
 =?us-ascii?Q?yv+htHY3sqp+SbkkFPDQlC0dxQFDKLe+LzWPlGUEN5vzuqUryCdp7YClxFoX?=
 =?us-ascii?Q?iJJfBKEzsO1zX+rSkpLiSVLCTYgW1urjSQFlG6svjEGC9CTwF/uxrvvt1+la?=
 =?us-ascii?Q?OwdVMgjngukJGtMROG4l3HIcAXAowujAXzRDK34d6kJTXyS6jqH8Mjh5KDHW?=
 =?us-ascii?Q?Skf2Zq19Tw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7f27b6-7a45-4421-5fc8-08de8a4d4e15
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 09:02:56.3881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bRzsLBOjQNxYvKfAwwoJSdUuvUHzijJT7hL8IPlYG8+DON2BlLfQTwJBnri/QJ2tcmfEVNNRjI6NWvzVpF6OszDrrZNCYxN3Vt9dKWbK3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15433
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30206-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CEC0A321D49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v5:
  - Drop redundant example from dt-bindings
    (suggested by Krzysztof Kozlowski)

Changes in v4:
  - Use fallback compatibles instead of standalone compatible strings
    (suggested by Krzysztof Kozlowski)
  - Reorder patches: dt-bindings first, driver second

Changes in v3:
  - Update commit message to clarify hardware differences
    (suggested by Krzysztof Kozlowski)
  - Drop enum cleanup patch as it has been merged

Changes in v2:
  - Remove entire unused enum chips
    (suggested by Guenter Roeck)
  - Improve commit message to clarify hardware difference
  - Split enum chips cleanup into separate patch

Dawei Liu (2):
  dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and
    RAA228943
  hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and
    RAA228943

 .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 93 ++++++++++---------
 Documentation/hwmon/isl68137.rst              | 20 ++++
 drivers/hwmon/pmbus/isl68137.c                |  2 +
 3 files changed, 72 insertions(+), 43 deletions(-)

-- 
2.34.1


