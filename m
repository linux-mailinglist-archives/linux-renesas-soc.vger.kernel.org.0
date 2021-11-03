Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6064C444406
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 15:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhKCPAy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Nov 2021 11:00:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:51170 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229946AbhKCPAy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 11:00:54 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A3Dx6SA015091;
        Wed, 3 Nov 2021 14:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=AIeeilJQq5cRMIq1MKIpBuSzJRyBH5l1n1DHFHMsXAI=;
 b=sz47va4RP6VUplsV8PT6gRbZh6oexxU7WYB/CYrKdxIUEa+ai98Ob5KHwXqmfhFbcZFo
 G8CSrS4zMEYwG10jnYqP+NlInpQtpj/rWwAjNh2LHavfV1rgIb0RYgzS2v+tr7ZnsseT
 WQcwiE+ArLsJOqlKTsrR/faFzguAB2LY78T4Vj62xxEHJu1eiJf6iybjzp1AXsIqJse4
 nYuKI0uovXlg63C0hKRub6UhFrS3d5tGIJOXgK5mqSWXdmfGueLj+rN6Rl7YttD2Qfkl
 nDiXEuM1GylEzuCOE1g8qK4I5d1iMjVWnkEwGr4rRCVP2u86P+xfLR5eTRTBGWGGa2bK IA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c3n8p29yb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Nov 2021 14:58:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A3EqLY8073861;
        Wed, 3 Nov 2021 14:58:00 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by userp3020.oracle.com with ESMTP id 3c1khvp31q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Nov 2021 14:57:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjRgNX/1CWpjGw++46hnETf+lEQSII8g3V+zK1tcyN4xHas3yB15BLflgZfHiQFCx3YVjJLx89UwePumMUmMkBJzAiJbDWN0Mj1gw/uUZJgPc2GkUSchymoOmnrC3ST8c8G9+xWfms2KqZkvoILfpJTRqAoEHrko7dwPZUp/X0me0iOAGzbhzrSxA0AccBBK8Qlw5cmpFv/9dSNhDPWlBuAtyAR7OU/QycuRrM9UOH3EpgQqWEutmWGPm11xXOZD9Yg/y1U4gVIUb4TumPxWJ0X7qwEecwu4n1MlAqmgh32qpYZ5L9gjVB/scGHsh3uNeG0889SGk9OJiZT9OXilow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIeeilJQq5cRMIq1MKIpBuSzJRyBH5l1n1DHFHMsXAI=;
 b=H0YpZI6xaxxX4RX7dhduVYVniK67DEzqiyli0T4lVCtSWcp1pUYpRfMrVRwScH7bSAMCnyglih2VC0n6CW2h3dI3qI1NMqRKbq7iPeMkJa1oPWaoMIkEcESMpaspwWBgDjAlBfgNlYzVJX6Eii8/66l1SISa5ob9pw4piqw4KzNsfAWUg0EFYAhE9/UtYGPz97LMdhr1AYAyoZkHB1xArFOOmAdTKOUMvbVo/rG9NuZDkO4fYBJ/hMSitEM23YfAZhou4ufLwQCCoxhrl8dq4lXxVBR9cIO+Tf0X51HjUN/xAh9RZCOImo/5qkA7pyrN9hvVMfP/O34g+fGkIML8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIeeilJQq5cRMIq1MKIpBuSzJRyBH5l1n1DHFHMsXAI=;
 b=hb8DSiiXs1yf/8FThSxuXowOY3ZLqWcXpMbbV5Egqr8Dl/5QjDiFnNNBR5KIT7NdSAZT799PFyjT2qKP05tfYliDVSHhb94Oc6HDMoB5fYqSQab8JHts0jcB6GxBgnXr/qmTPouYpQeUSy1HOHeC7T7CeG90dqIDermIKrx8nqE=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR1001MB2167.namprd10.prod.outlook.com
 (2603:10b6:910:43::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 3 Nov
 2021 14:57:57 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e5e3:725b:4bb:7809]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e5e3:725b:4bb:7809%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:57:57 +0000
Date:   Wed, 3 Nov 2021 17:57:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Alex Helms <alexander.helms.jy@renesas.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, geert+renesas@glider.be,
        alexander.helms.jy@renesas.com, david.cater.jc@renesas.com
Subject: Re: [PATCH v8 2/2] clk: Add ccf driver for Renesas 8T49N241
Message-ID: <202110281624.lV6hDzvG-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021213106.315-3-alexander.helms.jy@renesas.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0028.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::16)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JN2P275CA0028.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend Transport; Wed, 3 Nov 2021 14:57:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b21acc46-f277-4090-9c85-08d99eda520c
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2167:
X-Microsoft-Antispam-PRVS: <CY4PR1001MB216716AD596162EA7CF2809F8E8C9@CY4PR1001MB2167.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UNnWAvZGnfpiEh4ohCAUQNg0bnQVdKiCS7P8u+4gXOK5aoKJbgDGhb0qkGmwlwDnuEKyKtQXawgL+UVcy0vMqcO79GGOEMa8pZS4USzZ6pAltQiSQt2m3zacB7Y1UfPJJx27E3IBrPfHv95TWfYTscN7EqmJSILVnpPn3ul8CfERjNGw4OPnWLB0ZlKtOUMeGaJYzMQ+iRpGnm6MUoR9UL1IUMqzmdtoRozJ2uO5D9sGBDDQdOOPEmWxP9D8BSkz2pGMz/6udQtl5OufjlxsAqCkxyJlwryuHNueuJj+2zrnNuUMxarYXxR8VXVWHPoB7czkn8+XQOOJEQIyOdaT+RaMpUPhAWU0uYhdNLom4gOJHcdHLMPgVr3JYPwHEy79+JRtWRQS885mAXU2gcqPkPHbrOk+ajpgWsq3wxRSUWQd4tlyeQc07SDdEjDX36UHobafO/YDwmw5CHv03Y/+/QBnHSoJadtXsqRn7zhfureD9Zi9U7jT1tTjmucByBUqZjGL2iawzaRdyrkhRRzBOE2OVHvsls1TDLOcQnU6G0KRh63WT+eq+ORstoTasfHl9tmtX0p/T3Lk6iZPG3t12Zfvfa64h/iNy9j8ocaM1pIBlWA2ld6IU3WftZ3w72ePR7wabNsJIp+0vvC+E9uVUQCoWTcEPWcVVo6H4JcFfR2fHV7YMiI51DqV68UqdJezHYdXxflNuIgorew+B2FmoyRv+Qx1JXO+U8NB82dYirzzpi8wxnLhSygMeG4zmlK7kVL/dvie3dIobF5mGB4h3edjavFDb70bYtKyJT1tdFPoTVnl9BO/7g2hsazrt5IroWpXaRh4SZbu64zFcfzuYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(9686003)(26005)(1076003)(4326008)(186003)(38100700002)(2906002)(36756003)(7416002)(956004)(83380400001)(4001150100001)(508600001)(966005)(6666004)(316002)(6496006)(44832011)(52116002)(66946007)(86362001)(6486002)(8676002)(5660300002)(66476007)(66556008)(8936002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3v6Pc7d/AJCXYMhPt35ss38NVZFAhqbGjtcbD7kRlh6b+vsYXeJsYZiKm9oU?=
 =?us-ascii?Q?B9C44aQZ9tHLD/fESyLuZwopujF+I6ouhFIXy5AnxXGwL1oPg5F+W2dGf4+i?=
 =?us-ascii?Q?X8ifRp0i+jDBlyWWVW2YQe39YB0RmQi1cK3xp+oBO/R4TiFPtvyYF9oPFnhN?=
 =?us-ascii?Q?CHqZ4Wrsh3DaLOQj+QO94M0pakpkeOSbGYz/qAPz9xzhaNGi8+2UKV3KSlGb?=
 =?us-ascii?Q?NcK1BTij1Rl2KCwPrjZYYA8Y3d5zcLqLI+1CD7OtYRYjbaMa1k35EIh7q9jJ?=
 =?us-ascii?Q?b27y6qgv/zFLNqO/v4OPssINLOGOQdxtVRvqoc8XJ2Z4bEtL+64AEhYjPqjq?=
 =?us-ascii?Q?qFMEMXQz4SjjKsb7h63iLqB7PXQ5UphhiXyI8ZA+eASSoz7nmVeZSworw112?=
 =?us-ascii?Q?KO048Q0qLWfeAFj+KBApIOmhsC7LzjwfaEz0NeYPgtzameKulzTz+PCTMEYi?=
 =?us-ascii?Q?knh3npDHkYOo3qYhDklgp3cXnzm8i2lEhOubCW6+MjzPNiZv40399NYHLVpm?=
 =?us-ascii?Q?x2FuUKbqaFO/Tqm8N42Psfy/oz3F7pMx2Dx/Xbbpd8p7KNRfHqDjDjP8vQ65?=
 =?us-ascii?Q?FjZhhXVm05O5vTpI7zx9Dx0nZBAN/xd7nnIymT8ASYb8Ch9aWsAsf+UGI/cs?=
 =?us-ascii?Q?buehY2omMdiNcx4jjKSsRvme30RntkLvG/Q08cTb65IdQcinSaEotvhLr9Yz?=
 =?us-ascii?Q?TOxx9Y2tcW+R5hL4kSObWq6znExw74kfIRO+3B0IV7X5puW/EWRT78tnFVwr?=
 =?us-ascii?Q?ixRjxpVTzj1Cx+4wRULfmLXeW4cyj3WV1rE4KR997UFQboJJCp3I3qOpGvl3?=
 =?us-ascii?Q?Z0+b6hk4oC55jl77AdatS/D24uqNc6/IX1TRrB+RTZXbmpIFXk9QCCim0Y2X?=
 =?us-ascii?Q?XTpUQDpBxbVrfY8uyW4fg14xSJWx43rlrBADUceVbAFIhe2YeIsgTm9vdVn6?=
 =?us-ascii?Q?cx1hPRRyEkLMdyhc0QCGtVcxY9+xKH+5GAow1x81C+M6bfZ+dtnikaz0a0OJ?=
 =?us-ascii?Q?uEREj83KsccKu+E6fLQLxGryeAEYHspwTA2jd4cqrr/2sjhiHn0pNyU+HVv/?=
 =?us-ascii?Q?saffxpQfOr0MvMrDiNH4e2IQAy2rKvpvUaR0a9SGuQwGCwSg1ovP2QFUM7g7?=
 =?us-ascii?Q?pz98DS6EZ1/29lhGZyxb8LpMs/d6kEb4szWZ2DDPtBANHxMMWd/Hz3Ig6tP8?=
 =?us-ascii?Q?NiglFNxakdlA6/ZqKdqPUMSnmDESWyDLN7rXlkNxKIQ9LQHHf6kgh7KNBv/n?=
 =?us-ascii?Q?JTSQ5nmfbU+CRc8lwECxI6eBmcbdu6Oe9oBnMVTP81cek3qXvL67g4Sbf4St?=
 =?us-ascii?Q?pPzrelm5XnuLV9Bl1UohS0PemlLaNdRNuiV4LoYYYdDRQxBkiOhiyQc/Y/xP?=
 =?us-ascii?Q?ZMdGSGVkVEfe+ZSdwvRzBbgz7pOqSDULxdv1ZAljJKfERcEU0BMtLG6grhlx?=
 =?us-ascii?Q?1gn56baVetAOUagO2bOv/PLUdX63V8vb1jUjsbfuT8CgXJiNtVzXamtXmj3g?=
 =?us-ascii?Q?/K7r6gMd4RbxyobI13gYB4IJ8GS4XVdpvMesYp6kDWmhcNfOSKCjK0JyIV3f?=
 =?us-ascii?Q?+6PpLiXRTbpWuxh3kH7geo8fQtwXw0QdijJKOiiKBR94tX82QT5K1ofE5hVN?=
 =?us-ascii?Q?ZNf8GZrn7i7c5h2bya4lsQytxBRg7QPvbDJh4S7PvsuhRHL+APf23NdaVv4O?=
 =?us-ascii?Q?6BAg7A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21acc46-f277-4090-9c85-08d99eda520c
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:57:57.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH1HMBFOmkiMlZbDibhVJYwXG2YcR//iEBz23f0PiUAaXVvKAsc35tVGSt62EMOgwo11D/zU/IknPLA8uz98oL+V5ukq6R37S1i5Qw8U5nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2167
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10156 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111030085
X-Proofpoint-ORIG-GUID: T6hkRFFmPxSkSQa56cKgP8T-uF_OSgZP
X-Proofpoint-GUID: T6hkRFFmPxSkSQa56cKgP8T-uF_OSgZP
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alex,

url:    https://github.com/0day-ci/linux/commits/Alex-Helms/Renesas-8T49N241-device-driver/20211022-053306
base:   519d81956ee277b4419c723adfb154603c2565ba
config: x86_64-randconfig-m001-20211027 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/clk/8t49n24x-core.c:94 __renesas_i2c_write_bulk() error: uninitialized symbol 'err'.
drivers/clk/8t49n24x.c:416 r8t49n24x_probe() warn: excess argument passed to 'sprintf'
drivers/clk/8t49n24x.c:448 r8t49n24x_probe() warn: inconsistent indenting

vim +/err +94 drivers/clk/8t49n24x-core.c

38bfc1ee0c46d7 Alex Helms 2021-10-21  67  int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
38bfc1ee0c46d7 Alex Helms 2021-10-21  68  			     unsigned int reg, u8 val[], size_t val_count)
38bfc1ee0c46d7 Alex Helms 2021-10-21  69  {
38bfc1ee0c46d7 Alex Helms 2021-10-21  70  	u8 block[WRITE_BLOCK_SIZE];
38bfc1ee0c46d7 Alex Helms 2021-10-21  71  	unsigned int block_offset = reg;
38bfc1ee0c46d7 Alex Helms 2021-10-21  72  	unsigned int i, currentOffset = 0;
38bfc1ee0c46d7 Alex Helms 2021-10-21  73  	int err;
38bfc1ee0c46d7 Alex Helms 2021-10-21  74  
38bfc1ee0c46d7 Alex Helms 2021-10-21  75  	dev_dbg(&client->dev,
38bfc1ee0c46d7 Alex Helms 2021-10-21  76  		"I2C->0x%04x : [hex] . First byte: %02x, Second byte: %02x",
38bfc1ee0c46d7 Alex Helms 2021-10-21  77  		reg, reg >> 8, reg & 0xFF);
38bfc1ee0c46d7 Alex Helms 2021-10-21  78  
38bfc1ee0c46d7 Alex Helms 2021-10-21  79  	print_hex_dump_debug("i2c_write_bulk: ", DUMP_PREFIX_NONE,
38bfc1ee0c46d7 Alex Helms 2021-10-21  80  			     16, 1, val, val_count, false);
38bfc1ee0c46d7 Alex Helms 2021-10-21  81  
38bfc1ee0c46d7 Alex Helms 2021-10-21  82  	for (i = 0; i < val_count; i++) {
38bfc1ee0c46d7 Alex Helms 2021-10-21  83  		block[currentOffset++] = val[i];
38bfc1ee0c46d7 Alex Helms 2021-10-21  84  
38bfc1ee0c46d7 Alex Helms 2021-10-21  85  		if (i > 0 && (i + 1) % WRITE_BLOCK_SIZE == 0) {
38bfc1ee0c46d7 Alex Helms 2021-10-21  86  			err = regmap_bulk_write(map, block_offset, block, WRITE_BLOCK_SIZE);

"err" is not set if val_count is 1 or in a bunch of other success paths.

38bfc1ee0c46d7 Alex Helms 2021-10-21  87  			if (err)
38bfc1ee0c46d7 Alex Helms 2021-10-21  88  				break;
38bfc1ee0c46d7 Alex Helms 2021-10-21  89  			block_offset += WRITE_BLOCK_SIZE;
38bfc1ee0c46d7 Alex Helms 2021-10-21  90  			currentOffset = 0;
38bfc1ee0c46d7 Alex Helms 2021-10-21  91  		}
38bfc1ee0c46d7 Alex Helms 2021-10-21  92  	}
38bfc1ee0c46d7 Alex Helms 2021-10-21  93  
38bfc1ee0c46d7 Alex Helms 2021-10-21 @94  	if (err == 0 && currentOffset > 0)
38bfc1ee0c46d7 Alex Helms 2021-10-21  95  		err = regmap_bulk_write(map, block_offset, block, currentOffset);
38bfc1ee0c46d7 Alex Helms 2021-10-21  96  
38bfc1ee0c46d7 Alex Helms 2021-10-21  97  	return err;
38bfc1ee0c46d7 Alex Helms 2021-10-21  98  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

