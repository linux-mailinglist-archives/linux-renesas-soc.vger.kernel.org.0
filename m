Return-Path: <linux-renesas-soc+bounces-4671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F148A7BB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 07:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE25C283042
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 05:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D373BBF7;
	Wed, 17 Apr 2024 05:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="mD0rq35l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A52B9A2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2024 05:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713330680; cv=fail; b=VkgarvcpLGFdqxVbC+WGgHBksyKWpetxNhVh9TQvZkW2dqP0NMSzPF+26sh0UNmTILO94jhQYs4MHgme9OgOTi4ltOjjDphnAABN8b4AEFJEvjV2CQMCT9NZR1cmOidlnZLCGTT2j2uFbv0Tb98grrWENpbfOpNIoUvcMDdfXoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713330680; c=relaxed/simple;
	bh=m1xI2uwG/lJ2UG2YBaIEh5B/NLudwvjemD4oRgTxJoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aEei+sXbVLLmqx3kJaMr+HGfgDLovrs9l90153trCwaC2NmfN4V2Yx2tm5u6LqP/VvUzcHN2+Apey1r7VOHRYAY994/7WUHCRS2tULAHghP4gjxxbiqrjZaqV6R10ofJJ/nwWgzV/vy8CvRqyIVHbirsUN7OcW8KfC+L5V9tPDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=mD0rq35l; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb3N4/prgYK9FSEzA/dEa8Cxl1ZUi3L1UonVx0zbD3sVKUVwv3UxU8PwrY0HN4SIm1tRmeLN73fZ8E/AWAaStzbSfI55PKT6iL62NiRpV/WQDHtF+7GnFPnnsGigtbERMNuesq5dagnsfTF1Z91zbiy7vNvbBoV9EJyh3dfA+2CPQ7ANc/zoe0m47YXlY3HDELGeoiHdgK1KcCv0z7qd5cnobNvEPglduikldG9duAHHTBTvDm8dgWF01/Z0tN7L9uYrZH3xPkLw4sTniJM7i/ZdS87+wWS3bzS4UhUaCzWN6tjfW0RAXanNOTfMNQ6PxM++FAHcMVo5C1hdQ3jIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FE6IPfKDiRrnw+lNOsO5kaFGsESYfDdtonx7f0ajhQ=;
 b=e+L/xaS15gLmYjulUpSgLGWyRfweu6/mEgXMxQl9NMKXBtyFzvwXEg0l22IBgC0UFFpw8ibHn6C6taOZJKVXve6jqXhCwSfnboGUTJuau+OUUZxQj+bguRjzYaIc9pT3/o7wkMJT/FHralp7dBj90rTRAK4j3jQUgThoGIJokl/6UXm/SYywDD8gySOO+9N1moul233pmo8ixZKkgIRHqOuKewE2ASvR0yooso2gQ0wyVz8MzWbLUWfpssz33vtDLhpHqclx1VYJco/DSfbxIPRDZaPPOSUroL5ECqqX1MF/ZxZoLv+pSuyo45nvv0pJtmP70dHLr3K2utumFhn+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=sang-engineering.com
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FE6IPfKDiRrnw+lNOsO5kaFGsESYfDdtonx7f0ajhQ=;
 b=mD0rq35lxlnNNAHQlt25Du6EGoEYIS/D51J71S4PQfoCwY2kRYxOElXY2vofOgrg1iFB6piHJlY0CYwc1ozGnzb4RlFone0j9rG4mOHuj75sXZ1ZX87nax7SYhYdnheG6FGufyHsfQnaKucVcq1U6uKt/0Z7bbkxUGBfQypyHbqpYUa9wm122eu3XHGjUk+xdnQ/c4/bks3jd6ek4RtyExgY8Z4nP/bm5+uR3yNJTZSZO+4InrIvd3bCGTe2Pg7PGibUZUfXjOMaiqrWgYhb2nl7AFiEHGrKVZFkLkJ7psxChxnRfUf58kXdsWo287VWFXMv254fEsUdwzS7UQ4K+A==
Received: from DB3PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:8:1::30) by
 DB8PR10MB3209.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:115::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Wed, 17 Apr 2024 05:11:12 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::cc) by DB3PR06CA0017.outlook.office365.com
 (2603:10a6:8:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Wed, 17 Apr 2024 05:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 05:11:12 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Apr
 2024 07:11:04 +0200
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.37; Wed, 17 Apr
 2024 07:11:03 +0200
Message-ID: <2606f543-0a2a-4184-a4b1-3c7664c8eeaf@de.bosch.com>
Date: Wed, 17 Apr 2024 07:10:57 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] serial: sci: fix OOPS because of wrongly running
 hrtimer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>
References: <20240416123545.7098-4-wsa+renesas () sang-engineering ! com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20240416123545.7098-4-wsa+renesas () sang-engineering ! com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|DB8PR10MB3209:EE_
X-MS-Office365-Filtering-Correlation-Id: 9432a2a1-6115-40df-6227-08dc5e9ccd18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YR8WNF9fheabCtlvgwazl0+Mwk6eadI7zqTwsWW0qkq6fALhFz5z8S1zINfzLIbJ1gbW5oGNt4+G1dLDYn0ichWiGj6vfCPnCye+s0VrSDKodfuocmxas4qoLDRme8Z3vk767XQyzaurwgVr1gd22G2okaGIaskGlsQfpeyaru4rTDzBthZfReNZnRsxKhIH7xLWzaBynyBlu95rxnfvWN+Z3uznq1iAhpdHI7MK5Sgzc6W9ELf++11hOBvtspX8wX1VhMHIxeCcxOJ4bnPP6YG5b5nKIC5QSumZfS62vB7gll3/z5euF9vyGNbztIo3Zav/DE1hi0OvAVfdcbjVg+dZ6JujzI41b/rGYci1bkKEM/B3Ci67szKmf6KLGzztxPUCrumNjgGNlKOez5+DzKL8Q4nSyP3sGP4CdMZi4HNCGpNKkcoVDbJH7XDHBUCZnZhwpHOMfmdnOQCn8UbSX4THu7l8COys2S1Vt3fWCZYGoExC8w34l1O4nGaSsEOF41QZtp1PFjOioy9gW7vYvGe/pULNAd3CFBWH2rC4VHQOmG/NiHfYF3S8ca+Md1BHOOtgdWzem+OTCyiETJE9J7tHMbRydvZpjU1zIjnUgsxugCD+7EPB871Qw9Qn8n5PQSI0szvZD05CmEF+MNnWUc08VVEUqUHED+u73cJU2Z/AqQMzymcaC6OX2OD3b1IEj329cypts/IcMitSH9uJ8hsrrc1G52vf6Cmy57VyjrpIk6ANji2ofDbkSOT1FhEJ
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 05:11:12.7510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9432a2a1-6115-40df-6227-08dc5e9ccd18
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3209

Hi Wolfram,

On 16.04.2024 14:35, Wolfram Sang wrote:
> Dirk sent a very interesting bug report[1]. This series is what I found
> out by reviewing the driver. It is not tested yet because I couldn't
> trigger the code path yet. The console still works normally with these
> patches. Still, I am already curious in hearing your opinions, so here
> is what I have...

Many thanks for looking into this that fast! :)

Without much knowledge about this driver, from looking at your changes 
they look quite good and reasonable! Therefore, if you like, you can add my

Acked-by: Dirk Behme <dirk.behme@de.bosch.com>

to both changes.

Many thanks again!

Dirk


> [1] https://lore.kernel.org/r/ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com
> 
> Wolfram Sang (2):
>    serial: sh-sci: start hrtimer after setting up DMA
>    serial: sh-sci: always cancel hrtimer when DMA RX is invalidated
> 
>   drivers/tty/serial/sh-sci.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)


