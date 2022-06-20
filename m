Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05CEC551300
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jun 2022 10:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239884AbiFTIje (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jun 2022 04:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239564AbiFTIjc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 04:39:32 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6636142
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jun 2022 01:39:31 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K5uS2r005310;
        Mon, 20 Jun 2022 08:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=JAYlLSdu9dcBj1vK7Z2iWsaHIHLABrTk3PgwPQ14pDc=;
 b=zUKteId88VR+faG7o4SsYdQnkMVy2RwgO/evexvCYWAMBxr/9nHyLB4DRb8hHeaoEabB
 eHrN7ZqO44yOD8EtzeRQV4JSfAqvAbm6vdcLpavCucUckqLrOv05lDHPvQrCMGEdocci
 1mfPvUDv6z+rBUR9Mr6KgvaO48OJTo7NLLdXpRurDprQiuXvKdvK6zOB1f7lDTK3sN6g
 t8HCS9JGZXN7wHxxUPqgEtI/jLby7jA6djrEF2AIJBzemR9wBRHAmT0moPOV/fQfFNDc
 Vb1twBveoY2J4tIC6CaIj7cayx/qT3ngXhHFC5sC6LynbSmjypBMkftLTM6ZhyaZ1f3v Wg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5a0ap81-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jun 2022 08:39:23 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25K8acPq032601;
        Mon, 20 Jun 2022 08:39:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gtg3tys13-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jun 2022 08:39:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaprwpanFsEwC66jucBTSvth8Sp8KuNmJE0grVYu55cvJCd6N41eaeaIKPrDhJI2ojf2cBt0WdJyf698ujsLhrUz0yCgc9MhkRrMLsedURR+gqQNACN4JK1nyNw1cTdnauJq0hIlSYfGl1dlEZaCSk/HlFhKZk6+XXSpI+JPIQH2aPBapb2DbZWp19xUVltRj9mygcqjJhROqskOjfhxjEgyD9oHm+ugEDvxwZ2RXdihWyM/GfNRagd8T4R9SkPfqcYvcWMOquELd7jLO/GYiXkOeHZScEe6mz/BhOT5koQcWB9VmbDq6jWSwqNL84b49gHYBBBcYjxYQ+YJSxsmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAYlLSdu9dcBj1vK7Z2iWsaHIHLABrTk3PgwPQ14pDc=;
 b=OvN8aHFFb0S51WihHW97XDv6RciflcS6vIkIM4BomgpIu2LbGdNRIe5yZgzjC6JUix6dsLjEbbA04Rl/YZ19/lBnFhTGG9RJDvhgpfp69+nombcFqCxaPLh/bJG/3rOAiWeFlKn070jsp232sRbvfJp1JGgGPzb08Rmtz61IEJEOJHZcAwNnp5uJyY2T6kcP3bh2ceCTaIIzNxkoCMbdnu2nUtk1Yz1MrivDTbnPMP1a3BKZ3BfAkfprkWjuyyYWmJmHnPGR0ioztOEY5sgbstWU1EXniB0TteOUvkfQMI1RFxZpXbvoVW/YYcazxiCPwB336lVlffD2zhbNaIjmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAYlLSdu9dcBj1vK7Z2iWsaHIHLABrTk3PgwPQ14pDc=;
 b=tRcxoiXkf+StlLvUXe8dFlU7/geaaiLud+gEMI+zFM4Q4hSoTHg+XqpS5UFvQfRMsc590gztLUbt0FG9eGTzRD5Dqpg0E5J1PM6a20ePdXqA6W6Rhts3WK6QAnWHna59lF8C6K8cIe8sCc1YPgPQcjWPwtS+UxGZol42JEJGTqU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1368.namprd10.prod.outlook.com
 (2603:10b6:903:22::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 08:39:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5353.018; Mon, 20 Jun 2022
 08:39:20 +0000
Date:   Mon, 20 Jun 2022 11:39:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: [geert-renesas-drivers:renesas-clk-for-v5.20 14/19]
 drivers/clk/renesas/clk-r8a7779.c:137 r8a7779_cpg_clocks_init() warn:
 possible memory leak of 'data'
Message-ID: <202206191333.YmgTGPjZ-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c82383d4-c977-4606-a25f-08da52985e6c
X-MS-TrafficTypeDiagnostic: CY4PR10MB1368:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1368249F3898500F18EB0C468EB09@CY4PR10MB1368.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AIMhtumg3LkTUPaFxBG0EmMsBrn8uYDK0+aQb9/p2m8Q1Jm4rlIujh3QIW+2JWDsny5inNobrQjF5IrQfpCFadxWkrcQ9NhO9sFnA9DLbvmR20RaQVnwEj0koYqmYYpRTJ1LybVBU9WYb48rwQ0LjSlkQ0ujudUsGs9ls7wzBdr0jA+aNvH/6liKBHijxdCa997ESMwoWhEfgVoun+ymGdw6FC35V7h9/V0HJbPLEIsrsmdMwUvvdvXYAWyETgi/0pOryQZAUr0gKwRs782ubTxIAQO2z96Lxjgd4BkTCk1prk7ewfHSDblnfdkXFm9yWo5U8mqr8+a5c01z4soqS7BMB4d4qN6rysA4gy9LLOPz2SFiqPQ1dLnTMIvIUtk8wMNrHuN16hZdPoqnbGApyERapbqmKmUGEJ7qeN77JceLuETSW4MkPyzoipqvvBBc9te6osBtOZosEs2iEl6KSG2+EgedSveuPjSQJ3bOWBv+EAcNEhAy2JzcgUf87tJTZExglyDT6keyz2M1KCjUXqykHADR5SzQxeTAaNGQdU6I40AMLCeint9dN0KIR9sg6Qnlr2+s7OLTAbNCKQagla53CPBb8ObMNqvpgVg3BmPbcd35nF+BuoKcMiNNlMM0hPFJozmvKo8eLEZ0ngJTXFTL9ThEjPdCG44V5/XnXSR8qBkC92WVLI8/zG8wGHCXpiOHlEm/Sabh1B4RzLGtWrVXYgty97jLLABp2B0o18nyy4r/q4K2/+5zhcjctYoJdbW0P7uv/g8nvqB0F5Z6Y7g2OyveqZqpa1nOyWttFLuFJiWUani3R3ddyhOcNKAN56FQZA8LW/N6jJm6a7E2tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(86362001)(38350700002)(26005)(38100700002)(6512007)(6506007)(6666004)(52116002)(83380400001)(186003)(9686003)(1076003)(66476007)(5660300002)(8676002)(4326008)(66556008)(8936002)(44832011)(36756003)(2906002)(498600001)(966005)(66946007)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rq3w9RvQR3Jor8xQN0Z+BlCoVTTznYcNYqPCLlDKqVvarOLVEpM3LRGd2T06?=
 =?us-ascii?Q?GImhSZAQsSUn400sGhWr/Wnf6WIwXMam0n0fFD72p6RWT3/hzfIOnQuBtvtl?=
 =?us-ascii?Q?zuey/4GOS3WHwd6T5c/oZUOofp1WseV2egljc74F87eOofcVoBjm2Wb2/VNM?=
 =?us-ascii?Q?tiHkdt6ixQDw3sm8XLWoVEoIGmPQrf46CGHIxACRZQc4BbRfzfTmoqKRsAYu?=
 =?us-ascii?Q?KXyDN3AUioZbXs0jKStfy13t30AF8uoy47qVaN+LLNiIKdAb9EUfOEn98SPA?=
 =?us-ascii?Q?6abrOdeCsE9fCAGpizUrSBtn2gke7qZ4b1zKXu5r2M9Z2+aiI/kLI462Px8E?=
 =?us-ascii?Q?J/ovHshoXvSWkgnjyYinpl8t8aDiq4gw/3WnvYd2lCTllMv6p1wLHqtU+grR?=
 =?us-ascii?Q?48ddKxARwntRnH8KRdLJsqWimaqZs2VQnHmJcJAkFcdlLnS3CqzBHBZw/rm4?=
 =?us-ascii?Q?DKdS3I/PPjIkh4G3EHhOiyFLzrjTL0bYAWmIoPNsupfG7vbQGwlEderIKaq5?=
 =?us-ascii?Q?d94wgh0Y6V5XD90bGfispLild7B0sqm6kQVTPlglGHVlx+o06fA9lxKD2rLD?=
 =?us-ascii?Q?b9HpJLY9ISy9uOhAyFlX5H4Oa6U2rB3v66x636KoSm6tgAs+Yf/o5mhC2oja?=
 =?us-ascii?Q?6k6ShQo+GsYgrhx283QGehE2W6XrBGCkUDUcsdCYSLYKyuuAhzxMi/0hCoXB?=
 =?us-ascii?Q?TpYXmZvD6vKm5+9FaQ7Fl++1UMHm5AQiQte4llu+cnyZovWD4/BVw9OhG45o?=
 =?us-ascii?Q?s17zQUV9XqHLB3VTP3Uxa8EXW/9j1BqcIT4qnA2Y4rrTDYY2N2xhMYkhiY2N?=
 =?us-ascii?Q?TPxkhrPf6u0LNwXG+JStjIwlApaJJVFYhtt1r4w9YTNnUVVUZ3k60PoeDZdy?=
 =?us-ascii?Q?oScxcPwIlJeurS5jGTMDyux/+E4mUuaJxBwOU180STrjUpuvdGeNVtOva//P?=
 =?us-ascii?Q?XbnBx83yrtLrS9mbqENTzuTqNqhQYe2CTUHnqcqrvJJGrcD6cQxLFU9W+wwT?=
 =?us-ascii?Q?tO03jwjLvJzd64dHxcaUPPE5wziZpQpn/Spq1ypeO6qoZh2b47IbsfJZ+Jhx?=
 =?us-ascii?Q?Fbm+5MRx2M+Ab86KnLkByy5sR/dTtGjjCKik2f05YIJaTVh128FZb/AHrLT9?=
 =?us-ascii?Q?TUd0gJBL3hMqvDbyUbbj2gO6h975gbwl/vxtWEq/rMi0pBGIG10gIy1p7kAe?=
 =?us-ascii?Q?/gFrpGItw8modVcLQ+CAy3pBRfiMWvA8QOV+W8/SHbrsyIoJRDjtVxURpP7r?=
 =?us-ascii?Q?VHxNFRq2RjF/B49BPKW+T80LNtUhJPv38ijqFKb+DUpzeoq/iwq0GTY50EW9?=
 =?us-ascii?Q?EboWZhAnEYHtUglWxCp+8fVHlmZXXH1ReB1YNKJ5ffyM3Tz9mYAij0ZtKe71?=
 =?us-ascii?Q?+btpAggXnYPkYV8+21R8iK3AkaoRgka8x9ES3f1sygD3D/nIfTHrsDU7+0ol?=
 =?us-ascii?Q?lUGOYHmgrcNLGdOSy/4WP0F1ICKC7IkoC9ymcEwFbOT6AAext6lWJdrmFj3+?=
 =?us-ascii?Q?6yR4cG/BDJpnOFgxB1PiGWvA8hRGageMZRPr7KQ8xxWoSY6jHN9PWFHk2idm?=
 =?us-ascii?Q?+S5UJrbZU7aiX5lN3Wwxq10lPJVYRxIYZUFXo3QDgA046GdV1T8d76v+C9J9?=
 =?us-ascii?Q?69LgoXjnnWtuN5WmKJO4raiHLkDQCJiA6ChCrm5Ik2MWK76JkIUe2ppCF0cw?=
 =?us-ascii?Q?LJTPuz62+pDNw5UXh9S6We6A3gZpbjAKgmMYFx9ZZdYMRduZKqCUgljPSnWo?=
 =?us-ascii?Q?XEFnBqa6CihMGYLZ2IqItmezSB+XpXI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82383d4-c977-4606-a25f-08da52985e6c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 08:39:20.3561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgr92h0TdZ+wZ6MWkscTnSGU1OVf73I/XNOpyDQI/skdujBn7uHp2uDOF3YlTwzRja9uWnoIOoof2WCMAx2oZVOY5PUUjeJ/wtNuGFQQDdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1368
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-20_04:2022-06-17,2022-06-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206200040
X-Proofpoint-ORIG-GUID: un_MuKf1e50Hn9zh4yx8yvrFzKUfCU1z
X-Proofpoint-GUID: un_MuKf1e50Hn9zh4yx8yvrFzKUfCU1z
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.20
head:   080bcd8d5997b1a615e17cab02bd9d16d1d4fbf3
commit: 444877983933d0efaf6788eabf2f750b1c175419 [14/19] clk: renesas: r8a7779: Remove struct r8a7779_cpg
config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/archive/20220619/202206191333.YmgTGPjZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/renesas/clk-r8a7779.c:137 r8a7779_cpg_clocks_init() warn: possible memory leak of 'data'

vim +/data +137 drivers/clk/renesas/clk-r8a7779.c

7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  113  static void __init r8a7779_cpg_clocks_init(struct device_node *np)
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  114  {
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  115  	const struct cpg_clk_config *config;
444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-06-08  116  	struct clk_onecell_data *data;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  117  	struct clk **clks;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  118  	unsigned int i, plla_mult;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  119  	int num_clks;
931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-06-01  120  	u32 mode;
931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-06-01  121  
931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-06-01  122  	if (rcar_rst_read_mode_pins(&mode))
931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-06-01  123  		return;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  124  
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  125  	num_clks = of_property_count_strings(np, "clock-output-names");
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  126  	if (num_clks < 0) {
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  127  		pr_err("%s: failed to count clocks\n", __func__);
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  128  		return;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  129  	}
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  130  
444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-06-08  131  	data = kzalloc(sizeof(*data), GFP_KERNEL);
6396bb221514d2 drivers/clk/renesas/clk-r8a7779.c  Kees Cook          2018-06-12  132  	clks = kcalloc(CPG_NUM_CLOCKS, sizeof(*clks), GFP_KERNEL);
444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-06-08  133  	if (data == NULL || clks == NULL) {
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  134  		/* We're leaking memory on purpose, there's no point in cleaning
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  135  		 * up as the system won't boot anyway.
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18  136  		 */
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-04-18 @137  		return;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

