Return-Path: <linux-renesas-soc+bounces-24958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1320C7A758
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0B33A30ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F92334D39F;
	Fri, 21 Nov 2025 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LpYWXdMe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [40.107.74.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C133F8DE;
	Fri, 21 Nov 2025 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737988; cv=fail; b=QDRGXAqYZiJnQazwfYk5cBF3Lxr/7a2rtImNSMC9Slw7PsKmqcUBcFd5YpO6AKTwruQ9vuGTWFRaYDYhtBtpuoUN5qv3xfEmZl3liuAiVToZ8PS+EWPa05c6Ihsd5hafImwhTG/GtZOpH6EAB7OJK1JdOh/DUDq+JjnMruO5fKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737988; c=relaxed/simple;
	bh=o6LPzpaJIuOHFFf53aL/2q8fEPY6jVySZQQ3u4bq9yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NBwty3z/7obvfxHRAHbcwgz+sV+nRYfktovzQYByyJBueeJf2HDCClScHuzOe714WpMQej+VbNOeAS9hSetg9lBIjP16Wts5U3kd4FgZwDUUa+cF6wcesIYaGI/c8bfgOBi3uCiT9VJhOfm5Gao+SP2v9HmiL8AtSyPg4qK10ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LpYWXdMe; arc=fail smtp.client-ip=40.107.74.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNk008fCP+EUkw/dWpVCTt/amgWcpbR2/qdaijRMnAsB7kI7f/mQdSj+Y5SsnAuVzWs+tsvaqdpLJIBcPRSnwl1+wQo5JVd9gMtUQzvQsXzqrl3Efr60cc6XwU1qNQsb+H3HENt6cxSC5VPD4IGaAcegGCZvN1NiazSQYxoLLKS3FRc93KC3W1X09Ln7Ye1W4HhIbt+PUgL9tvde3nT1vA2BWmlSk21KCIf1R9CSigWl9M/7kPYUiGfob1s4eKsRKXKHmiyYrxRLA148m4z9SZEypBPIbGWx92vzKDK4xj5oJAFNnEKa/g9YOmzEWDEF7G87eGknds3qOSTDly9ZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aptiB8N7ly7GRYEn9xKyvXNbY4obz7cRs+v747PzFbw=;
 b=WpbOXdqUYl+R+JeXmdTXwxXgN+gSNDZLnM0lNpLEcMGYbGKxVgmd2ZKkcv6ZIMWR7GBdNA29KymYRmedeqOD+O8vpk1rNFmIZJ+zQ+fhfrc9SDEieiolPz0MC4ArDJClywRm+zWs1r0oZQOJ0gelEBYvzS8NrzirBtuEJUVXPIacJne9YMqFuUkjYnYyxj0Ek8S8LDOvUFhtlblON8Fx/tcOGdSAoio9bsnGZ4PJDMLbhpnUx8chI4MDytGOWUZWMssE6Bh8QpTeAscEoJP+YE9l+X+CJMQS1BgOSCztnspvVrlzhVtQA9/p3/YLOu3EAWws/gt7r/oz+mHOcM+5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aptiB8N7ly7GRYEn9xKyvXNbY4obz7cRs+v747PzFbw=;
 b=LpYWXdMee1nruxyaSn7OamG/Xnz9rfoirCUMFIvWKg2H74OVqoatV6IBi7HpYH0i0+XsIJxTV2frd0StIT7Iyzs9EVp6clQnsmQAAkjV7GpAVplZspo9fBM4s2COa+SRnWos35d1ksZt9T/4UC+ClagzaUlLaj/5PkOx9bCTqEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:13:01 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:13:01 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 02/22] phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
Date: Fri, 21 Nov 2025 16:11:51 +0100
Message-ID: <cd67ca37385ee9fcfd4c1b700f8d7df3c9453a00.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: fac57609-909d-4345-19bc-08de29107624
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZkDjaCv0Sn8JV/cVaEFLtnghuSgJopNuFSVVfJ0+sOIeRgLUuEgUr8dUrvUf?=
 =?us-ascii?Q?2uXzTDSH4DRsfx0ONhFfZtge45EjTjPEts3kmK0fqhi+RTzPNQC3fFP0szwf?=
 =?us-ascii?Q?zDrZHVmhQmFOFbdg7YfJrd5+1odKg9iDdaB75d9gkp1OL1prHTJfSsAjVbkA?=
 =?us-ascii?Q?vVKYP8ePhlQD5k13viaiSTKIVUZtLESLZD8S0dayrEO+RX/5aDilsPc8rSjg?=
 =?us-ascii?Q?N1JWD3YIbKBi/gZNJ8W2Yxsj6zWK2q566CrkktiIjMVmpPVq5FFjV/PnZ5Pm?=
 =?us-ascii?Q?1EsykNCXDlZUHuzZinINhh9uOTq+Nxr0HawrbE771PZP8+CSieb6DzdMpgNS?=
 =?us-ascii?Q?osutoPCnP7drPXNbKJphL40udnXXRrBncEZW+9JeDMg9CD6znXRvoHtCoioF?=
 =?us-ascii?Q?HH3ueussrxbp4Pdi/ItuKDYzVZfahtWNRNeNGrH68bNUdrWsNqCY9XyZ6SCI?=
 =?us-ascii?Q?H+v1bYxc/GNX+rmtzS2HiD4T9hj/FlTuT6Bwxt4g5DLwTTJvcsKzB/1678yO?=
 =?us-ascii?Q?+3IkWXsGIeI1idv3aihmexiL09ifZEnn0rCJWalnhy+Sklq1VtEIBI0HuM0i?=
 =?us-ascii?Q?eBZYibUa1ukJt9S/PCvDEcU4lPrt2ZZUZ2nu46Sx6HfGwpE5XHI7k8nNrVRD?=
 =?us-ascii?Q?CBt7NF5AHym5rGjgpvaR9ZoFMBdW3Fj3eRVesknlqLlK73KQU4L/aAPVoZsN?=
 =?us-ascii?Q?7q3nEjzyCZtycfoc0NlvZ0kFThYriWcbXc3jsO9AiKwnfdnAz2EC3buLmjYX?=
 =?us-ascii?Q?mfTyFgxwXHPns1IGR42oxcFVK5paeS46Y6tMqhCprtN8Mq8LlTM3mpjZ1hQE?=
 =?us-ascii?Q?gqjZ1N9uhE5OirMgl0zm7OaWX89lvLeGfx/BpgqJ4gTpBV0cUpRxsUI+Ge+Y?=
 =?us-ascii?Q?V3I75eUdNCt+ePNxAxcvqK/IKpgD2Y4SqeWw1rc41Ssr5O//tW49/gRRZ//a?=
 =?us-ascii?Q?5IQjDTMmTLQZyfTyJsVVM0PsHClm3uxgZeX7QraF2g+sBayBUYUo2xsXu2ee?=
 =?us-ascii?Q?7rX7c0VRD2VeMVj8QP1lKFwxtrrJMjgPtfG042n06olkOSbqsdg8l+CUIOHd?=
 =?us-ascii?Q?46rZJPwUibvV1jE+R2Y7UNCzA4j35hjk91bddBqibjoRVzbU0Ar58zfEbMvL?=
 =?us-ascii?Q?E4r0YmL0Nd5y2019z8gFx5WWG069A1v5Eeh2UlxSQVqsTMyrwRHaNMJOPSW7?=
 =?us-ascii?Q?2GnfsvD73DiBksT1r6xUR41DVbB3Ef4k4RCkZsT264wGDTvDJjMmap1RUlUH?=
 =?us-ascii?Q?9zmIQxrGo/6v0YbEay3xaBNIlXji7pAvu4A4noifVDEGHBZamNS8AxYm/GZ5?=
 =?us-ascii?Q?d4y5bhu6fOhkqne4SOMrl5O2P9gcKYwje8cdhmEMxaQUxljh/nK1DoGf1Ixs?=
 =?us-ascii?Q?XZozL4Kd9iZ9TDgEL7xA6xLesHSBbHlZhS+qUwN4RsKcmxmdcrQcOJMbPrlZ?=
 =?us-ascii?Q?FiYngt5NucK1Hfv1OAoOcHGZIz2tBB84oooQUD3oCJDrrEwFUFKSqoHxzLa5?=
 =?us-ascii?Q?Tuanf+mCPg67N75qePPBg/ORXSw7+eQU0hGK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v3uC+HcefSsnvv1+z572vjYedkXAqU8ktYpQc+uFrntTixI7YffclZopwaXJ?=
 =?us-ascii?Q?4e76CyMnn2DoKAJ7YdLNsBk/LfJwFd4MX0phRAML2T9Lkpr5Iq/EcXVXnRWB?=
 =?us-ascii?Q?zV6txMxZXyoJPh3hMId1hp4jeNXfAP3EMcgKiF8YyYOIjgre3RNaBGXNGBH1?=
 =?us-ascii?Q?fBIALQ+rf7/3ETvXU6LFyZu20k+V8EwoklFoZxuNzIm+mNELe1Fl4uw55LEo?=
 =?us-ascii?Q?VGAaMe3dXKmx2NV1f0Jd8E4uCRdHuKlZ19L30+Vea5focrdnml+yIuBOm4EC?=
 =?us-ascii?Q?ksX1d9SqH+aZLkQ29aLl2Fgo+12pc2gka7uegFMxmKwcKLNwMrhYbgL6zZzZ?=
 =?us-ascii?Q?5kByuD7CpRri4/QNZPmBK4s76AEXSXWS6MmjKHCv0jBfJuhe475UoiyOPMJ/?=
 =?us-ascii?Q?PzSAb2P3bXpB1L0/4yQIfg6j/OCJ2dxIbSom5ExPBnOyxEuLnh7eMNH4xVJ4?=
 =?us-ascii?Q?/m0l1o2YN8hJ+FFvsRIUnOys4JRbTm9MRMsCAGvCjuPwOJpLhEZkQv1ZjBgb?=
 =?us-ascii?Q?bQ3/zyI8FtU5iv7Sd0Q8WCDxKg9XJEROMUio67bULU8GpZ9h+tBphuVFK1wX?=
 =?us-ascii?Q?Cz0qvwSjIXkdFjoMmCLA/GxIN6CbibgzOG5eZDaOxk9n5175z6A6w0i0bSYJ?=
 =?us-ascii?Q?sH4rsiRQVppYDL7x0zVj8RyiLKPm39GUL7G8E6CiErb38uc5ZrIgXshQVwNG?=
 =?us-ascii?Q?A06tCT9yvKhrpc/NRRsaLj/y7fkJ0Xxx66ovQvYDbvnxBSIElnuURCpwoIwy?=
 =?us-ascii?Q?WFfrDQbZZk/H9zY//efTUALTkKo6DQYVcDBbSKGWEhgz/iJSMYw5x1Ae9W6A?=
 =?us-ascii?Q?TNO0anA4erEnHz5Gxc6ViA0iFO6bIFCATVD9WrFtkjOvKYbHTD6Dpyg+Lvct?=
 =?us-ascii?Q?ojiFSuCr9otAqwYZtQV6RuqLJre47e0Xd+Ny3SS5pgfmOE6AgwCeCptFVz2K?=
 =?us-ascii?Q?KXCnqDzZ5j9rqTw1tcDsBXWM0y7BCqYiO88M6gpEATXKjl/XkpMB9GyP/VoB?=
 =?us-ascii?Q?rzURwk4YQ4ykE6qHoWpW//N2FQROTICWnr9WGlmTFBI8vs0rM1UoQ/6vmIxY?=
 =?us-ascii?Q?IPtq/Gw/MlyZxfSAvc9bAgxCvPrID8Z6nIL/wEYJXtjNc8ppXpm2q1b28Vbe?=
 =?us-ascii?Q?p/cJFkROf5pyd9hNbWJbnwo9Q+IAUBZjgwQ5RoAsyLzecba7VkSQ/xGHmSsW?=
 =?us-ascii?Q?REzPpAoATbBMRepUU1P5hVhFRNKdKlVRg1rduFtMfD7Rv+tdVQmzbHFxxSQP?=
 =?us-ascii?Q?wZH1zUqS8+KyP97Mv3WN/1gJEuk2V8VQ+tmmbNQlOSy8gFTYQVPlOYdfiTuH?=
 =?us-ascii?Q?n/5MCp2OPO9DJte2Fv6l//Aa3FgsVC2BNclxuKrokvoaMcem2dHnf53n5iBf?=
 =?us-ascii?Q?mLAeV+m8jIGqliqC4IUF9MPpgbLB9bdPCiQPk8awLvF2BzGSxKSjI6zKNMKw?=
 =?us-ascii?Q?z1grljlm01SSq/w4RR0KGmwJqOTLee0u/H1oQsSs0yZFxTWhX/55R0Mqp9pp?=
 =?us-ascii?Q?0+f/0ew9iDSaV/3jcg4B44Hvh7AOOFtMyUWklZ/ZBlu1MWUCQdx/qv7v51ic?=
 =?us-ascii?Q?+vnlXJMtBX5UYQWHZsC9WIvMx7Wx41tZahpdDcx8fz9XnXjO218BKfFWmYE9?=
 =?us-ascii?Q?vwPFGDKiAp4PhSYlyzB+Lfc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac57609-909d-4345-19bc-08de29107624
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:13:01.4850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4X1sUNh+WL31kRXf57/0W53IMRRdDFtWsLLDMuOrg7GzIOfysnlHpZB6P5Xg9QvkvD7f3XeyZD3mNKeuum+wgTT7JEkproOB/6HXywI8tuWLTLhnedIFqRvwbdQRE7to
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Replace pm_runtime_enable() with devm_pm_runtime_enable() to ensure proper
cleanup if the probe fails. This change enhances driver reliability by
avoiding resource leaks, as the devm-managed version automatically handles
disabling at probe failure or device removal.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 53 ++++++++++--------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 582de10d5beb..41e0c818ae34 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -852,30 +852,29 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
 	 */
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable pm_runtime\n");
 
 	channel->phy_data = of_device_get_match_data(dev);
-	if (!channel->phy_data) {
-		ret = -EINVAL;
-		goto error;
-	}
+	if (!channel->phy_data)
+		return -EINVAL;
 
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
 	ret = rcar_gen3_phy_usb2_init_bus(channel);
 	if (ret)
-		goto error;
+		return ret;
 
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
 							channel->phy_data->phy_usb2_ops);
-		if (IS_ERR(channel->rphys[i].phy)) {
-			dev_err(dev, "Failed to create USB2 PHY\n");
-			ret = PTR_ERR(channel->rphys[i].phy);
-			goto error;
-		}
+		if (IS_ERR(channel->rphys[i].phy))
+			return dev_err_probe(dev, PTR_ERR(channel->rphys[i].phy),
+					     "Failed to create USB2 PHY\n");
+
 		channel->rphys[i].ch = channel;
 		channel->rphys[i].int_enable_bits = rcar_gen3_int_enable[i];
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
@@ -886,44 +885,36 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	else
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
 	if (IS_ERR(channel->vbus)) {
-		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER) {
-			ret = PTR_ERR(channel->vbus);
-			goto error;
-		}
+		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
+			return PTR_ERR(channel->vbus);
+
 		channel->vbus = NULL;
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0 && irq != -ENXIO) {
-		ret = irq;
-		goto error;
+		return irq;
 	} else if (irq > 0) {
 		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
 		ret = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
 				       IRQF_SHARED, dev_name(dev), channel);
-		if (ret < 0) {
-			dev_err(dev, "Failed to request irq (%d)\n", irq);
-			goto error;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to request irq (%d)\n",
+					     irq);
 	}
 
 	provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
 	if (IS_ERR(provider)) {
-		dev_err(dev, "Failed to register PHY provider\n");
-		ret = PTR_ERR(provider);
-		goto error;
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "Failed to register PHY provider\n");
 	} else if (channel->is_otg_channel) {
 		ret = device_create_file(dev, &dev_attr_role);
 		if (ret < 0)
-			goto error;
+			return ret;
 	}
 
 	return 0;
-
-error:
-	pm_runtime_disable(dev);
-
-	return ret;
 }
 
 static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
@@ -932,8 +923,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
-
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int rcar_gen3_phy_usb2_suspend(struct device *dev)
-- 
2.43.0


