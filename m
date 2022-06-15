Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2896454BFD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 04:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbiFOCyM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jun 2022 22:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiFOCyL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jun 2022 22:54:11 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0E72FE73;
        Tue, 14 Jun 2022 19:54:10 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25F0T29t015201;
        Wed, 15 Jun 2022 02:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=+wJj0IOmqnGM4GXkF9zJgIC3BSS4JaBqc64oLTWJBzc=;
 b=MmFvtD6Y2m+XzI9wHVyyXl6yO/tlMQHjtNRWrGRbhcb4gvA8c/ny2rhT5sKZWigWu7MV
 SOj0/jEqopk0BbCuo9AMTk6nSjOe5J59vSHhyYDJPGRpSGfAGwtWxe7WaJj8cQ+o1yuC
 +0svZApcMpwELc9qSy+PLIgVE5ymAgYqgUsyTV2o5B5PFqVJNBW9Byv9SnpR5Si2bSGA
 7+Dx0fBwdnWjc+Q5ZVCrrkSdKmcUD7GUMwUXqbbvC/Ii4prxlWgPDFbxNsk22g9RYKoq
 YbGRepOsLjY/eJhI2KRvc5vi2v7rtCtFIGDWVN8Ul/cigQdBZwVPfBM05qCfVn1Qaazz DQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0fdhu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jun 2022 02:53:57 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25F2qDSB036643;
        Wed, 15 Jun 2022 02:53:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpr7nj4f9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jun 2022 02:53:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlYA/R0b/3MECrbzbrMsUbGL6jOi2GAxs5uee2lKeW/tptJVgDnUpZ/aZJC6C0rWx58gWQ5spzbQpZBuOracr+ldHogBmAcqkQV5ncE7KGj03QY5TDC7cLgFhS3NNnYJWbdOro1MIFJiQhmPuoIc1LR5/0D2gSr9kGt1HXrMA5kA/hAltMf1yIe8HYkz14jUfX+FlTGZy9EZx8wioFupUIrgbXCE/BRJWoZTxzz287/oe1tIOK7IsSv8wi8R9wxrXMZAEVY63fOMH8yRdrKcWSJduCS0KdmLI/PALzg3PVCnLaGqV1w3ormJzTpPg8KU2Y+Y/cwbPA7Tv+VMcdwZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wJj0IOmqnGM4GXkF9zJgIC3BSS4JaBqc64oLTWJBzc=;
 b=VCf+rjwcqhCJWtgU0o/7h+96XBfhqoInBjznmMOWiCLjsBJq2fxA+D/UxUztaensmG2aQGUdF2EEJoAuxWDcwEZ5yDnGJPirAG+PCLYSEHBIpxsbGi6dxguzRoP5VsbKAT3MbZxaJUdN2JFRsey43HcGp9MkmpY9uiWKC+v5pyJu6C2HmZu/oWswUlWtXC7qE7mgoMEOFNIcQQLQurApID43Fcdcxv1yxt+NEdhWUICjDf4pJtqUTEsaACGA0jUwaEZqyzF7M0N9WhM42jMo7iiSDrcLWhV5LCKM20Yg5+acjmfsxmwM5iDN5j2bUJQScR+opCB1WMsExMyB5hHLMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wJj0IOmqnGM4GXkF9zJgIC3BSS4JaBqc64oLTWJBzc=;
 b=NwKAtJQ1yLW0C1x9EFYVWzhirNLZTZ/FIgf/LhebqEfMEkOp2YYxVpgT/k8e4I1DTnrrpsGCXUfiLoNo9mVNMmrSms0lyIg8G0z6JftdK6VPQtyyRJpj+gVn+EO91fDi7cUKTfGi+fODD1tQKPWTSW1vIxBAXmpFnH2f9rduMpM=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by DM5PR1001MB2108.namprd10.prod.outlook.com (2603:10b6:4:36::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 02:53:54 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::6516:e908:d2bd:ca45]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::6516:e908:d2bd:ca45%5]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 02:53:54 +0000
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
Message-ID: <yq11qvqskps.fsf@ca-mkp.ca.oracle.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
        <CAMuHMdWY7OpB=F3sUoBEpMyJx9U=+YJBFrVd59y=wdsEvN=4JA@mail.gmail.com>
Date:   Tue, 14 Jun 2022 22:53:52 -0400
In-Reply-To: <CAMuHMdWY7OpB=F3sUoBEpMyJx9U=+YJBFrVd59y=wdsEvN=4JA@mail.gmail.com>
        (Geert Uytterhoeven's message of "Tue, 14 Jun 2022 10:00:21 +0200")
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:806:127::9) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad1e370b-63be-4f91-4099-08da4e7a4924
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2108:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB21081DB1A320BE48C5B403748EAD9@DM5PR1001MB2108.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y8e9+SCcytwN8iIeR1Hmp8CRMhC9it0skyZJBsaLlG3llZzxfUHPyjZXuEgVAWprpu2AjLMjnfHChfO+oZ35JwcinK+y4rfhgZiu7APYFWhTZz78FtnlrgZiFvXYK0koo46LQP4QtT2ImQfJGhiT8DXzcjcaZngMFkmiCXIaK2aXwzry5EEERjDCdTnJbdmcq0gCeXcXM3mgudFvZGm4Xveg0cTuyZoeWnAzbLg3T1A0QDX7I0loHrQExgz17kfDl5LVhufUDWysTVPe7hOFRq4TK/C2/2Wdqx4E4vGed63s2LnbrnyytSsiA6QHZbwrGoqR0eA+RfaT1KXO5Id9d5eQLwVUH23fH9NLaaQHoktn2DzWx85H0TvwWJPUL9tVJJYNVZADfl9TTn25XS6Uc0cYf3f/p+MEo9c/KfgAxW5DvCPnVW8fvmSfBMGuKbEvBqhgTEYh0ZUCn+dMrU1xtCExAzjQ7ayakThN9Qtqkrci7sfT+GtfAA2ShiEfe0YoJnvBPMV6XMEARGO8G3XVu0O/83wa4GzSbyU8DYMVCgPkF/fz2DPVU4nuvDxrcQxpt1bO7M9LBRnb5tINvD3HX/SDCG9HNw3Spntf+0YB5w8LixEQnKJXBVgmFmEmrBFMMnJ8/ciAHfJOLa825DzIJy7HYUG7lqcGJqQwlARAHjfVG5DhRlsXr3z9wgqiDaIns2wpStcwDXe08PiJJ55t5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(316002)(38100700002)(6486002)(186003)(38350700002)(5660300002)(508600001)(86362001)(52116002)(2906002)(66476007)(26005)(66946007)(66556008)(36916002)(6916009)(83380400001)(6506007)(6512007)(8676002)(54906003)(4744005)(8936002)(7416002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V3d0GpSLWYSnrcw1x5lWTK8CYb17MRMNgNzGgF3PINxzNuP04pbcfqC5sKzu?=
 =?us-ascii?Q?Ic1i97OPV3JPXGosBIE9R6KooNyzvkCYLPGMmguoXm5Xghvoo0HpR4l1WIP7?=
 =?us-ascii?Q?6VrtgNOB+xsaBNicKVPMM2F0eoRT/b1tEsCG2DxHsE9JJRrAL1JXzb7cfEbA?=
 =?us-ascii?Q?PRUlh20E7z1nv/glSpjWoqtc2DehqXp4/e8uoUdy6IVkfRGeDSe//aHusO0D?=
 =?us-ascii?Q?xkKWJOmnxt/2RcWldC6PfmK9ZmULfr9X63hVZywNYlioG4E+19NGPKhO5/OL?=
 =?us-ascii?Q?yaUajLiojd63gx7gZuC3CTr8swks01lsV3+1a539DkJadggLzjAN3iD3AVjj?=
 =?us-ascii?Q?B0dA3/Jhl0WtW8rY31JAxlks2HHlhmGvmcTuvW/OS8RDS+J1Nu4Di6h8yRvP?=
 =?us-ascii?Q?2Ew/kCtkq5O2x3HmmHiD4gBg87KKyMm/Jb/a7uLGMAtNPLoispm1MtQabfXo?=
 =?us-ascii?Q?OSTaPmBXaLLyfKsry4o8dUZ74jU5oZIWFoDg5GHz/YehOxRixaxjqSYViLV9?=
 =?us-ascii?Q?iu1mzi07yLLqXLnu4V86Va522OiMGsyTsrmtwphFpTcZXPgqAo58aBKoVnST?=
 =?us-ascii?Q?DH4VHCBcmDk7+Iksjd590hP5u5jKfunHTkydXh9RVFp+9ffxFyjz4RLbbiKN?=
 =?us-ascii?Q?YwJVxeDvu0PYuqfgxSGQt0xvCM1K/Q6gzhmj637Ho7svRz67RJfyDsmyHRw7?=
 =?us-ascii?Q?r6XGHvdl3y3QKBfHvBDbmQ8anTkrEkV690W7BuIBnktVRyR2qmABnWrkxah5?=
 =?us-ascii?Q?rmgAyxXn3CnSh94UUIBJC3rECTJ15UfwdsIHk6y5kdfJfrb8U2pmYY/X6s6+?=
 =?us-ascii?Q?mRIFU5iKsuEFwQcS1FUymXDf58dIvLjNXgMq/BSUXnw3YYCWI2UHQ3LP4PDh?=
 =?us-ascii?Q?9cKlQAJYOBSOIST1k+SMm4lY1nMziR74UWyYDZss3wwYwlahR0nhXrJm6mte?=
 =?us-ascii?Q?UWGRuPDCqOEoMq0GE94WlsZxLEJ2bwoGxldwN75TeZ3asD4o2qqJ995EwgpZ?=
 =?us-ascii?Q?Q5WoT+kZ5pVKM8CNfzOqM1bvXYQmhHnsl6ONL/7U5Ucre3/BPHX6WbagKFdK?=
 =?us-ascii?Q?XWVxmANZf4c+Rqe87zUUmC1QPrs+6oIki3yY2DYjvsEYEmzi/HLpcfur1mlX?=
 =?us-ascii?Q?9Eq1rLxMcSbOPmncFKZJ/gxEjRhKd+NhP0l/xExkKE45x8GqmIdTfbT0EpiJ?=
 =?us-ascii?Q?VhGNlPwdY5wafUlvBI+4fvWBr4mrlUZkXo9b7IqV7S6t2AMPNSyx7BMNJggy?=
 =?us-ascii?Q?YElcXdmCr1H9JFcj8veh7Dlg2QaiD3+67kMXir4NA6lmS8+oVhaJ1hl4I27v?=
 =?us-ascii?Q?W8NYuNkkGcbHldahfmXWmtIa/q8yws40fQ9TXf9U913SMQSuxouZ9yQThFiq?=
 =?us-ascii?Q?tmWPm6SiPSnyTvHzhOyrozhyh0Cl2Mzo162e3KgIgTtRgO5qbi9o/Mq1kzmO?=
 =?us-ascii?Q?QwqWF3oJkSsKEr5azcUjG5rYAt/3YwWNVZuyocuMM4cg1+2Hue+2oRLpb/JP?=
 =?us-ascii?Q?yFCcQ1VaOTjvNOY3CrtRdJ3si8WPzVpjZBGeqQptyhQp623d6GrTWDYeErRr?=
 =?us-ascii?Q?aSYULtBG+UpuLX5sEO2VVCJjs/NrwhMNMpd6cK8zT1U64ETGs+XBsPzvCMZ+?=
 =?us-ascii?Q?wFplGEEjIcGlooyp6DbXdCLSIpAQAI2naY4LlL7eQKoLEYnExXJoSBwyFsBU?=
 =?us-ascii?Q?AlxwO5HI18TEDCCzmXZQHyAywGE1zstTng3D5V5cDHvBn+cYIUixCBeMhQQT?=
 =?us-ascii?Q?HHk71/xa+YVOZBtqwe0mCFm6mtMp6+M=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1e370b-63be-4f91-4099-08da4e7a4924
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 02:53:54.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdLQNSHS8x0uJz3/Y3z5GtjHSn5Zm5apBbC3L9gH4tuOD3sRE5xmjFvUftCxb2qhmCUfozeg0e9T35J825Md/U6j7zoGBkYj7OtumDuQWng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2108
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-15_01:2022-06-13,2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 suspectscore=0 mlxlogscore=893 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206150006
X-Proofpoint-GUID: 1_DC09hsZ7dmCDfUmeNA97qzBp9T_vxc
X-Proofpoint-ORIG-GUID: 1_DC09hsZ7dmCDfUmeNA97qzBp9T_vxc
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

> I see you have applied this series, including the DTS parts, to your
> for-next tree. Please never apply DTS patches to the SCSI tree, as
> they are meant to go in through the soc tree.

OK. Just queued it up in for-next to see what would break. It's not in
the actual queue for 5.20.

> Can you please drop the last two patches from your tree?

Sure. I can also wait with the rest if you prefer?

-- 
Martin K. Petersen	Oracle Linux Engineering
