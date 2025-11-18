Return-Path: <linux-renesas-soc+bounces-24724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C250C69FE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 5B6F82C42F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5E634889F;
	Tue, 18 Nov 2025 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Un8WJdhO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD54317711;
	Tue, 18 Nov 2025 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476043; cv=fail; b=ZaPQ7uU97ywP7o8uyYJtfTchztrmzLEuqK8nE2I9WGLOUOjCM243UaQ0zP0xlmLeL0E5ZMVqd3tLWRk8iqpYm5ivMvFsugbbyJGjPQuJf203M20FJj17+ozZ+TD5g/AoxqdE1sJrQaY5CY+sB9cciz4Xalvm9uZH2XYqPXgZVao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476043; c=relaxed/simple;
	bh=So2A9RsmWjydeGZdtpvWW3r85YAgXj9EY9j9FwkNCLM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LSjd90xyCDfpJ2uNAkrPE0pfnH8EG1DlA3rBOav5LdtaS7KB+04e2g8L9RzCab/t1Jhf8r0D22g1ayZAQf1X0dkj7Gs12JBI3EMto6b4mf1T0U9Y3WcYM+bM3dAq/7Gy7IEUSp9Xd24Z7ZVucs96yQ6F8HT6pApc9xpHu880WdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Un8WJdhO; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDFFlC6r71mYqV8dzx3LgY2lD+XBdKOuST+loIDg3A/oSPDFv3UYXR8GKxEEJr8cOZCfHa6ksg5TnQ5GzKO+lyhJ+ZZ1OrsEONuuZTZ+OLEbM+mjkhRpwwLFkK4QhjmTBFtQmoXCTCYcf/RawN0WrVYTJEMWEa6AlQRfxXSEZ8UbAl+05Q2zL7xRED/1hLvbqFr/7oVyZCldsSTl+w34Um02W4JxL7JGZdaE2Hfmb7J+ExtDORshaStepOIPl28q6HPKa4Fyv9Cghclbr3cEiSm4t7cArUJsHKbvBh/S+EVqpgRUdETkY9BedoapQeSz4CjdjzEeqNagBfe2/UkuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTSQbxs3Gzc9mR9z3t5XVCpijDrJ9H1olKH4cU1w5Ro=;
 b=u/ltRMUIZN9K69Ec3SpMdYrP0wokiO3tEdfUcS20c7ZMEzckVc66lW7ImUoZbvq4m6BAin5U04DA22pr2amAlWhM0R7oE4/Q6PACGlqNArq11dZl861SUC5WTBW4i/pa4nkvE9vRsofafvgx+Zvv816PEbKgOv85fgjrois2PdCI/VOSVqhAoDgRrMuqn8grFdz44Cxv9vleJO623/w5LqvvJGPe9x8L9rrA9iUCtGIflcyBT25lXuR4z5UDkDPY2NitnKJQySUQRtWfB3DL8dJxCNac5Yo2IytEXdOICcO/BuchDdC1oMzhqhP8iprWlP0gt5QsVC+2efdOPKLEWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTSQbxs3Gzc9mR9z3t5XVCpijDrJ9H1olKH4cU1w5Ro=;
 b=Un8WJdhOg/eExTP1wgl157dzjOFHNDPBv4QlkwiHB8LHqZmycsShd9hSd6jopTZ8npeSeR6PC5NgDIMtpkUCaHadmDWRdNdqVUoHGJz/5nfVbFAbKXkraFvkGBhuD7L9Fcza2/0t9iNgk7fhAPZz3Il8LTz3+2i4lhhQxhO0jds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13363.jpnprd01.prod.outlook.com (2603:1096:604:331::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:27:17 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 14:27:17 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2]  arm64: dts: renesas: r9a09g047e57-smarc: Enable I3C
Date: Tue, 18 Nov 2025 15:26:37 +0100
Message-ID: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13363:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d01ca4-83d2-4ea3-b969-08de26ae9337
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H924jP2Lo/huo6Pt6DDpj2Hx4t9ivgqgG/VTr4TMrbmaihNVKhDPbs07V2D+?=
 =?us-ascii?Q?Wv58VEdOffb3aOJBs7V+rl9nWEXNo3sXOAiBDwHSggY5oRDhYq+nBvLzdhpM?=
 =?us-ascii?Q?+L3yPrLtkOVLUWZr7Jhn+RtbWM8uvbsPP1+jtD2s/f/wM0JQJnzQCm0rcdyP?=
 =?us-ascii?Q?3QMoWtXA0RcpCOVGiOmXEQFiA8/iZsumO72OthM8FAwovZU5ei0hfcqv/jFm?=
 =?us-ascii?Q?8ribId3BUK8mGEcTOMBO+DZf9h+BHv0ooYYZy/d+EiZgdjTdizAGjf4J3MIH?=
 =?us-ascii?Q?9It9ukT9b7Jr//zZNx6fpFn7B9D1lFDRqycnUmc0h4syg6ce4OYAux0KfDl+?=
 =?us-ascii?Q?4msIdfZoR3cFRlHs+7OPrbGigNggx5Ddka6LwUYGd4mnZLKORjqhT/nG0UBc?=
 =?us-ascii?Q?2sugFhaMo6dF6hKc9gtSpU4u4kVV0BjfHr2trYOXBd9S47N5OoA95/xFOAhe?=
 =?us-ascii?Q?r8sUFT80yQBLJyqM4tomOUeWc0ev17gfWZRxX4A6zytO+ioEUq38ioztgyZ8?=
 =?us-ascii?Q?XxdHYdWGy0kmaAibdbA2bqOgMuR07PoquzBo/IDnUcLZgwGmSPCMbRBOJkj5?=
 =?us-ascii?Q?DPBlOpuxKEKyrYfrZS+4H++ZzAZW0boLuSLVhQ+w96KjH4vW6aUyHJErNdI2?=
 =?us-ascii?Q?pDMj2FtZsToQpGH+JCQPOG3NDJk/zlNVQchn2F9ptjXDRwH4nS3VbEimEGtV?=
 =?us-ascii?Q?D2drdKjLRQabZiS+VHVtdULAYMa8PSK+RQc6qwc4HygtPWs/9O/0V5sLucgF?=
 =?us-ascii?Q?4fNdqGSHxuy+53zoxOxSZgWPA2Cjwj5X1WIGEh85Iz7IPIYLX3kzmPi9aLQw?=
 =?us-ascii?Q?Tpgh8NATtnEqjXmPsRvvfnaMozng6opVtWgBsKsAX6OWbHNITA3MweH1IDmx?=
 =?us-ascii?Q?dhUWAX5XjGco9NvArHxaCkO+FSlbAXuYNqwbwmulIvb1UEA38HPQTiP5auRt?=
 =?us-ascii?Q?x2r6ZtqWzG8Q7DnaNOVigF9wTwfGnVKcOlp8IL7xEAeJuwTSh3etqXFp/GZE?=
 =?us-ascii?Q?0VgBOpO8eOVAJaa3r2cPUdtF/6WaxWXjvmq25J1l2JNxWk9fLv5nXuwWzcMn?=
 =?us-ascii?Q?7G9/gJJXLcOEdQT3LvTDeQKcQAdkg0tXeC//jZm7gZPCz0SZjbEYBp4as65E?=
 =?us-ascii?Q?ucgTSzknN01R6ZmRtE08YGnek8x8WR61DC57HUivicshHiFdZcUwaWbUiiXw?=
 =?us-ascii?Q?SiutUeEAHOIESiN2suPXQ/vFJalwkNtdmv3FCODYYkcfS5rPSI+CQbeLucjK?=
 =?us-ascii?Q?mtYl8r57A5ClMDZX5w7pJZ9kQ4eeyT/WcNUNFESQymQeUanGuTpr8VAuMooe?=
 =?us-ascii?Q?OpYMcdobTd92poWLN0gDK9brGjCI297yB4v6dKu3RTtc0faPygnARCR6l90N?=
 =?us-ascii?Q?HJxb7h1T8F+qi4QWGupIdOIOw6ctufcJEPOOP+jxUnPef+gz9+8B0Xhwyf0R?=
 =?us-ascii?Q?XJCJBE24zN6tlmG/zBEf6H3Nr3AF+nj8sr+LBUG+d6iJ6CvYy1XCTcAFJ44D?=
 =?us-ascii?Q?ENZTu5E0xex/6P2PGDZ4fTx2KlA4hhau0Ov/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FZp+SthnlGr8Y9U3WPbcD9gzm7Qgw+AK5hbKMg2FwICQfg7LDB/ajCLF5V7i?=
 =?us-ascii?Q?Zpm4+oh92z0noW0zuFe/PY42e2zdv+Vnw/YpAigJ5o+MCO3OY/pZNSB4tBuj?=
 =?us-ascii?Q?1gQc28zg7k6SI3fsHI8h8gBKRKSRjDhEdLvzmFNdYBRq0KbwXUlWkLVRnHKC?=
 =?us-ascii?Q?P+UrhTHqrBvci82NPtcPfgj0kFfLNTp7cEvPosApmg7CYwky5V6pBlUO/SA/?=
 =?us-ascii?Q?OKia6ELrZLcA0VCjb5yBBzEHsEC3DAq/DZJXC2VpvZ5hteCIJUSQf1U48lm9?=
 =?us-ascii?Q?N723ruvreGijA7s8KQiISPwbFkes6EkLiTu/D6t2IBUdUo0dhw0Ew+gubNGR?=
 =?us-ascii?Q?H4WvK1x6Wm04Y8Z8DT5YcAkguK7yj4/tYQUA8bARPr2arFOrRlzPXKgi4O08?=
 =?us-ascii?Q?Y5zoW5Rky102Fe5c+nyNnC1Ya9NYNPaaxYUxVn263okxH2byEaScKzj2X5KY?=
 =?us-ascii?Q?h4ro9YE5cJ4lulPAnqUOeb5apEAiJR5wixkeaS5LMjP3Yjj95xfEhFU60Dnw?=
 =?us-ascii?Q?vb5CDelelhMwWkp8XGnX9dE+aeqbQNRIX1P1+osEqbSIYJoeuN7y/8wHak9F?=
 =?us-ascii?Q?+I2I39Kek0O/W1QaW/vonPm82j4ii+JLeZlfzS6bH4GVjXBWA/6/o/5PbA57?=
 =?us-ascii?Q?uWiJPnFB9yjGg7pButU6hQIqbhcM5EfBm+rzGKV7lBT2RIGyEkpP3au9LO48?=
 =?us-ascii?Q?01ABTFbdF8oZ26Bus/Prc/PrdkNfzLm612rLOt10GWpcrflgyCpNElY0nlnA?=
 =?us-ascii?Q?5LtEY101o2/izw2a1c04m5v+tIoPehuZjJtId2XT2bWsuEdQWbiPdaijdf5M?=
 =?us-ascii?Q?L7rZCGZkWKnOtu+froiFMR4AwQgh9WnyNExAA7S5ENu404iqzDyNeNhdj4hs?=
 =?us-ascii?Q?G3b3mxJCcwTUQZ/u3RaInndgDAo+FxbEimM8jwAdmXCnURYN86UiJ6JCSMhH?=
 =?us-ascii?Q?9Uew1Vi9YKo3eK2YMXxO0uFTDR3bqIUzZb5QJUPyYCUKNmWUY4/Bx1s1uI0h?=
 =?us-ascii?Q?iJFIzcqVAIjkpdoeVHBHEFjbU4cEUFTjoQzD+0ZqlSBIrx75PEZOoNqK2spQ?=
 =?us-ascii?Q?HZXJllXbXhsazVfVMnmvkI5QkonH9Ui/Gi76I6kTlAwYvwSF9XYmRBDcxEDv?=
 =?us-ascii?Q?qSlubSQrkD6d3kA3obaQNKdNnqkfz9xphr0n0f0xXw92GvESQvAPTknUTKru?=
 =?us-ascii?Q?6imA3F+kFBOi60yEkGCW+7u3pQR9iNURzzIt3UDAv3tXH7SF1qWhA14+S7ch?=
 =?us-ascii?Q?vtX1Um4tUlQjRvAfKhZILWsLuXRFJZG2RozL2owYD27MWt2CC9u37TiFSpti?=
 =?us-ascii?Q?oCuxBJ0hjXDY7KWg2lgBkAtwzBIxzizHnH2ScuDvLp1SI7jaVVfSO1R5hc2U?=
 =?us-ascii?Q?XIRQsAXFr5YVMncQm1X59cVKkiqdonPaRyEaz5W3AwbUbL70DgyqsxOYpDei?=
 =?us-ascii?Q?bIo9POwVXe2E2wqxjnlDpNuhfiI8tEahQ8RvFxxW8PPm3nz85ghYHdw3/JfV?=
 =?us-ascii?Q?wtifd1NLFQEvtIlALv3xmE5blWgOLl0sn/qlHwVTuGpMNuod8/DT8Rbx6oKZ?=
 =?us-ascii?Q?1iZCGNutL1e+ZHL+cjUvamZo4OVPFhFIAmQRp4Yth+o+zNh98RUL7Y6GeVJQ?=
 =?us-ascii?Q?Bcg9wE7TqW5/yKK4U1vn0Uc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d01ca4-83d2-4ea3-b969-08de26ae9337
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:27:17.3865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbDHw8+T3ZyUureiHYosa2OZsAtwGweyDMwgfUP5FmSdwZtubtc649c3bdMFyQnXVywUVJyVBag9FbCwr8eZvBzyM8kClKbNesnEFNxNAvLfEHKni2uPUJNYenQQs4ge
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13363

Dear all,

This series adds I3C support and an I3C bus alias to the rzg3e-smarc-som.dtsi.
This also adds a device tree overlay to enable support for the NXP P3T1085UK-ARD
board when connected to the RZ/G3E SMARC SoM via the RZ/G3E SMARC BREAKOUT board.

Thanks & Regards,
Tommaso

Tommaso Merciai (2):
  arm64: dts: renesas: rzg3e-smarc-som: Add I3C support
  arm64: dts: renesas: r9a09g047e57-smarc: Add overlay for P3T1085UK-ARD

 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a09g047e57-smarc-p3t1085uk-ard.dtso     | 83 +++++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 13 +++
 3 files changed, 99 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-p3t1085uk-ard.dtso

-- 
2.43.0


