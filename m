Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9712154EECD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 03:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiFQBaZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jun 2022 21:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiFQBaY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 21:30:24 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73C063528;
        Thu, 16 Jun 2022 18:30:22 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H0qMgB026649;
        Fri, 17 Jun 2022 01:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=sz070J6xB8pWDUC9zu3F174Vp4JhUxbUqPiD1H40WNI=;
 b=iIXkf9oCGMXYHiu/+eBUpE3thJONEHO/jPxsKyca5r3ZINey+rwN9pGPAEABV+54TAMO
 DpDjT6lcKEHW+Liyb1+05QUbUH4SDvVB8Rj44bz1m4+gUxixiQOxGWu5dIdMwT9RsFbd
 FS7dQxFEO/xrnyj0T/vdPuv59o/OVoSMden9ZuDTOh7yQB318hdD/P5SwlTaHWV2IpIM
 MHKrvm8i34yYgfxeG8wFvAanBflvkLZXlijyHXNYAbRbK291JhW2r1ejCzITHbexaMMd
 R2c2T7lwbgaNRrblkQnx8xFXZqFk7TUHXC6fQ+3XRew1fnO23aKoKU+dA66JTs5+umq8 5Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0mrkv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Jun 2022 01:30:07 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25H1AHJw020108;
        Fri, 17 Jun 2022 01:30:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gpr2bvc84-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Jun 2022 01:30:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLlqGxa4T18vj6RDKNCUWHR3pswB/Iiajc+PFatnW5BDnZx68byecik4XUboIkRMcwuhxi8Jg+xK87CYW5JVvh52NNIqhNHQiXlqz1rR3D3rh81lE2la9VU81o451GMLgVvgjKojh4hgYGJDfqx4KlvJnNVzmecgIAqZBVCVcd6BWbh8BHmKya7qeCi7/doJJ9+hQ/ZA1axQ4IAELq4HbFfKC8cu0k4XzbwlTYruP/+iMUatsflajbI4y0cJiMDlX0D8yu7KR4kGPhI1OrCr0q4/JzJyKRNl+ZqeKXKiBaez9Trp6WsCtZWiu9jYfwFPMpLOfHEIkgXXjmvBmkLMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz070J6xB8pWDUC9zu3F174Vp4JhUxbUqPiD1H40WNI=;
 b=KPMXETbcQ+Gv8nNKeVLOSqVz8na2fLX5x9hsJyyMPdJO19RktveJP9yX1m56+2aXhuLI0FzVkViXKS1CTAV59rk0h/awdfKKMlxe90WIC/eksm2nsOevtUxeZoMMWRgGGjw63+iTw2ZCVLQvb6yQMJavgIatPLuWvBgWAeZzDd4FbMzV3gVuvNUGIFRMfi5OXpfsS/J+x6fMhaP1FRJ8zES3xXJQ467Vo9qKdoCLAWpA4QLD5NqF1IMxQRf9j1U5JDKowotrtvljI49dhj31qhTnsbyXah1yBpYj6MqZm4dmReXW6BYE4iRkxO3xKI2BkMb25jJQYTVitGPax3+U5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz070J6xB8pWDUC9zu3F174Vp4JhUxbUqPiD1H40WNI=;
 b=zP6e2NmUPrxmSnnsd/OThotbdix7Bl06IgGFiZgUmwdbzoqlpdNRvtA9uk2+OuhXQWJu9sxfieQYmBR6zL7O4jX/lm1z1LJJQVg+3SOfTG1+Fdd+fsOcUOvu7/TCQYC18Tn/C5L6ox447VSJkw3eFw0Cqn9amyViHXsKx2boylg=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by MWHPR10MB1981.namprd10.prod.outlook.com (2603:10b6:300:10c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 17 Jun
 2022 01:30:03 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::6516:e908:d2bd:ca45]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::6516:e908:d2bd:ca45%5]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 01:30:03 +0000
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 0/7] treewide: ufs: Add support for Renesas R-Car UFS
 controller
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1k09gozdt.fsf@ca-mkp.ca.oracle.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
        <CAMuHMdWY7OpB=F3sUoBEpMyJx9U=+YJBFrVd59y=wdsEvN=4JA@mail.gmail.com>
        <yq11qvqskps.fsf@ca-mkp.ca.oracle.com>
        <CAMuHMdVR2=VHUxfDTukDt7rSOPBYCFr3qXQzZNTdkw9Z-jEBkg@mail.gmail.com>
Date:   Thu, 16 Jun 2022 21:29:59 -0400
In-Reply-To: <CAMuHMdVR2=VHUxfDTukDt7rSOPBYCFr3qXQzZNTdkw9Z-jEBkg@mail.gmail.com>
        (Geert Uytterhoeven's message of "Wed, 15 Jun 2022 09:20:40 +0200")
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::44) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2b173ed-e179-4de8-98e8-08da5000e6f5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1981:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB19812F7EFB207A36A8CAFFBA8EAF9@MWHPR10MB1981.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/YyQFlCsB0dk7GZDJ17k2gVt7dXjdNYIlzQfFGQM03YUgAyVl2ukLxS/Gfd2TceYU/rsDLhDJBn1fSp41Xo3+igETtFAIGCtXI7lXyL/bJrXyddiuYuUZU1MkcVZ9sZ0vTfoHFF/MtEFYoph7ITFZZJbQYXCjAL4vgUGh0m0jvDg8lI9IXVuJpU14jv7abwmc2OB9baaQti7JDp8su7VWL/8zY0idecrBcEe31Pkc2kx0ZZhkyMlnroG84gnf5lgdTn74F2j3HhAqkcW3MuytC77IlT16oUBFEdYpy9z5aOGbNtHYELWJSwNwVynl1v3USQw7RWO/clxA0q4iKdPdzy+ydFGxtjHrljiEoYRMScPHFHHa+hmoxuLpFAQky9ZVruncLrgduTNH8hlACsS+Mb7zcRzn4K1ic0IQuqxcZ41JSXYiCukPiNtBtl9QNFcBBM6WPrAHjIh4VWC3CmnygfxOHnfzlFk7BVdZkpXrZp5WNbrS09bB+LDun6sHVYljNPC/9yClwyhd2L8ZUnrjKuWhzKW/YQAU8GhEPcM6Ykn+/reYTOkxHSmNHUYOfZwc/h5+nGZGtsDH1DM5n2jhFZXQuIuM70kAQWZXhzOqOrijcv+YEqbsQiYmhLBMZ8HePREZ/OMytnHi/epUNvG2FbVDgBzVwenaB3ED8RMOT5a3DoptrTjUBnafmpKknv9CIq5GCg+9GiC6ym5vPflA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(7416002)(8936002)(4744005)(26005)(2906002)(6666004)(4326008)(5660300002)(83380400001)(38100700002)(508600001)(8676002)(6486002)(38350700002)(86362001)(66476007)(54906003)(316002)(6916009)(186003)(66946007)(6506007)(36916002)(6512007)(52116002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZQspu0+CLvzItrxsPWYbi+T5A8/kxDWexUnd+BuWwWdaSAb3G7xvf5sK6vts?=
 =?us-ascii?Q?Ufv0wEORq/jNTLq48B3aSLDamf89MnWzz7WY1fEKrwVxPPAQOtH+PbjBsy1q?=
 =?us-ascii?Q?QzwWUCviVlnm+f2ITWjs0oVsDsOl9y97gbMr5ixQCPtO4cLjqbLAi4vtMET0?=
 =?us-ascii?Q?OYZfN4Uex9xq4W6Go0eNUV44X4SAG7cE+sAi2MlrW6kkwTQCgrhNEFNzUc5T?=
 =?us-ascii?Q?4HIKUG1vrlVsaP9C7UjJWSUyzRtFqSSRBu9/Wwc4acEX02ZffN65OeuUQhjo?=
 =?us-ascii?Q?7GyjxoeyuwA0nvPTL7j81JPWIhHY6o87YDoOQ9nc54jZhHWwAtwdxqcMq29Z?=
 =?us-ascii?Q?5535ZAyPO+UZFrVFHPIfD8z31XBGXvNfcjbf1TL6mlW+NqlIanmSsedDRl+v?=
 =?us-ascii?Q?edYX9wqlOXGJHILVoJnUpVNEgWeblE3oaHPDlBoiIDgX6hRW+nUYkvCdQjbM?=
 =?us-ascii?Q?TQCLwpm8CQ5hmd2xejKd3zYnJn65jDVUzDLwk5lSJvq1maJ5HJAyw6bICTdn?=
 =?us-ascii?Q?WqUJtztj+7rELvmcEA4kaWgLF2oezDJVIfXv+HB81amDwBxIjW+c/C5TfjAI?=
 =?us-ascii?Q?VBnJ5ZKXAqG/H4TZZl3JGAWkZ2FXRqsKr/sFtOqjZhzYpizk8R0ckEZeuVht?=
 =?us-ascii?Q?kBw2ajJKw5kWeEc1B1MRKjvVwNu0dnrexJc4h5f9hpA6TErTU7SJoJi12aFL?=
 =?us-ascii?Q?aS/1mDuWL7CZ7IoJetn8qrLu+Ka95ErSDBupe2yZ49/QNn1S/2lQn/oB0zb1?=
 =?us-ascii?Q?2+927EyHWDlFM0HqqUkbLmIcoiMpxrWVcvjuz3v9gf48eYAzcffTLH4WCwZy?=
 =?us-ascii?Q?yKe7SOm5qUUzqPh/rXvtHTAAlWrsL2VwuvYa0rS26LOzyeNeSiJBzhWQF6G+?=
 =?us-ascii?Q?7qBiqcU2Avt5LtP7z+N5UnWhM2rgi78MdF9HKfMyYkxx9cQBfH4EOqC6J11o?=
 =?us-ascii?Q?xAW7idNaKuR6RTMDnV77kzlfg8S4xECD7GavQLHTsAeJ9uIZqfjZg4OBP4cV?=
 =?us-ascii?Q?s+FAbVEoXk0nxpwFg9rCM1GAgVDFkKCMp5vejxV6XUyvg7+2r5iM39Vweak1?=
 =?us-ascii?Q?7cyjwilcDNBzc7l3q4b/rBjCfh/hvvPMjhQ2ASkug5M83u+pzgZoIMZcHCtg?=
 =?us-ascii?Q?GfLEB1oqJdeFmQjtfGgkvA6vAFjB/9jR8Q8XP+I9qh4139/psqVbZr7/i7Fi?=
 =?us-ascii?Q?pE2OHNxY2SUiJYyIyWkFIpFOffPTuk7XUNQL34V8+YPBzRAOsh2hriyuud1w?=
 =?us-ascii?Q?mAL6NuICAoOj8t3gCHix3rfTiEu2pGvlr1HelajeUtINkkCYCtB76U3e7yjC?=
 =?us-ascii?Q?qshRu5OID7Nd00/AZmdKoUx2qaap7KEnNe+CssW1dWHZkBaeYbGsltQ/+QlW?=
 =?us-ascii?Q?OJeoJ9PHdC7WQoHcYxR4Ql2L3b7P0f+BmPCMwSj0KS69kqU6LxfC2/KEakp7?=
 =?us-ascii?Q?PzNLj+J7lieiYc5PKiwTLsT/0l04qtn9GPCS6gTkL4DKoQxFKGFYoTyCMVmt?=
 =?us-ascii?Q?kf2HfEv1l3lkkMq3jMDNMVvXbhK30o7mAK3CbG+AqQvk4VkfQGzibtQZtLWv?=
 =?us-ascii?Q?319iARrAvLW4qd+/lBsndXvvadfeOtfUjkzTEKeaJswhOq0kjLWYSpPEJ0Qh?=
 =?us-ascii?Q?mgEhfAIO8xOwu20G4/MMrbi2CMx+2qOa/8WlOCi21yiyDhWdQ/z5ca9XyvJa?=
 =?us-ascii?Q?O8k+GfWHJek+sHc31bLrb4gW7I+tUAoVJ5X0pn/BOBtsTWI1eDGY1ItXEfhn?=
 =?us-ascii?Q?12csNuMzx8R518nEmfh1uBwRW0CfiP0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b173ed-e179-4de8-98e8-08da5000e6f5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 01:30:03.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JB45+W7CEkxah/Xr0qfvMfEqyMBQtsnBFs5bV8GKUA/v+qnn8k9tASrnkLDme6BE4DKBDeP1m6+60X8L8q5CNoofdhxpPI+fjTYIoDvxHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1981
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-16_18:2022-06-16,2022-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=930 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206170004
X-Proofpoint-GUID: kdbgOaJGXm2uGU-CnAxJbzSLMZVcyQOy
X-Proofpoint-ORIG-GUID: kdbgOaJGXm2uGU-CnAxJbzSLMZVcyQOy
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Geert,

>> OK. Just queued it up in for-next to see what would break. It's not in
>> the actual queue for 5.20.
>
> IC. How will I know when they are queued for real?

I send out merge notifications when patches end up in either 'fixes' or
'queue'.

My 'for-next' branch is ephemeral and I often queue things to just see
what breaks. I do not have the ability to test several of the drivers
that go through my tree so I do depend on the various checkers to help
identify issues prior to merging.

> No need to wait with the rest, unless you are not happy with it yet?
> Thanks!

The rest looks OK to me. I'll leave it in.

-- 
Martin K. Petersen	Oracle Linux Engineering
