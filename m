Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC83478BD8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 06:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbjH2Eim (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Aug 2023 00:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjH2Ei0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 00:38:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3D910E;
        Mon, 28 Aug 2023 21:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693283903; x=1724819903;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=85J+KFnA5YKXUWctjCF9aRsPmlILgvwv+xUI5vNYIjY=;
  b=nJ+bB8WQNRhUSBHYTJK/RN2XY3XkuGZJKH4X5PQjyk84gFOnDTjE+94b
   XLFONNulTSQsD3s6jMBrtlMOTJgQOaiIVmcQvgjuXT12GNdKbhFEo6ZEo
   gxsygEPSV12HSlCAensWjoJSIeVzDqi6JJ129Xq2wtxehhxxG8WalsdMI
   C4zRpfI0S4eH033Qc/mgHKz6BUQ/EfBSUh+IQ5E7MlgaUB65pUllfZEBG
   yNkXxcnBvDIf8G8GrnCB2SbhuwiYtpb85NMOqikDBV9ytEXHrohNZ0v6p
   xW2BCWsDNgNmjtekPGWn8MptbZ/elHWEGlj0q7WPrS3Ibe3MOR28f4W53
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="374165381"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="374165381"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 21:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="862095172"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="862095172"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP; 28 Aug 2023 21:38:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 21:38:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 21:38:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 21:38:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 21:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwy1KS2sR+vFj468SvQk/PAzoI9n1oKnH2JI0qoQehv/WvbD9pj/SeuAsD/SFHts8O0ENPxqdnmvGCypFU/vTZPU60J+NtnrAebeBzo4Y/woA/VL54NRQMtcD6NBqo5Q4lirerVk4M9n0Gf8aJNg0DbICK4wdcJv7Es4KcbR6UsluHynrMnXDKWroPt2iqQSnkpeer2A17WpCtJi6Vg1fd64XyTkoJZ/KBvXikwKN3J+gJAMx22UwryiYFieMAfjk51mUe2ekOopG3dnORQBT3FJZ5qovNesEfo3i+QBaH2t4+bRzWArP7Q+QPXpXBBA2nlAbTXYU5oyMIv6UQ5uGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaWrr0LAkfhUc/v3FkL54UKlJlEFfB+MKio3ptOB9JI=;
 b=lPuhljh/X+RZLAQPk31RJmE55rXgtukW41FDSmRZ6oy9LYPfKkcS7ulVRaz9JJaWggsPIHNTKCXFySXa1IJvFk+BZbJZQGjeVPZg5aWn46S9XCjZsrT1GdZbktzJcwABnGVgU7vV7DV8fIPjRp3MH5O65/+CYmtFxahx/TcpKizaI0rr7trdc+VWpdozpK/Syiqi1bmhH8sQ9bVn1/cbqSccMtziDUWAY0aY+4CvE9DS71PEMOG7tkkYRTQvXt0En8kpB7WGd//KiyyaB0a+QLYci8Ibt5HR0ZRoxaKLXKHXq2QPU/wcxZ0kX2aRb0sfmFbeuwP06cvePPoe5YcSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 04:38:07 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 04:38:07 +0000
Date:   Tue, 29 Aug 2023 12:37:58 +0800
From:   kernel test robot <oliver.sang@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Peng Fan <peng.fan@nxp.com>,
        <linux-renesas-soc@vger.kernel.org>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        <oliver.sang@intel.com>
Subject: Re: [PATCH] of: unittest: Run overlay apply/revert sequence three
 times
Message-ID: <202308251623.c4668e73-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert%2Brenesas@glider.be>
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|LV3PR11MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0529c8-e381-4eab-00b0-08dba849bd83
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MA++Ohbbmi3IEvD54NHE1jfauCT1BB2TNQ0vXBBvlgJFM6Q6gJBG3Trg9BOQbtXQXQT2mtzV+cWGkmI4VtZTYlMBEZdsPnEI74O6lg1Zb9+Ez+WZHlIu78hCNyRcKLOmBD9/0Qk5aXNitSS2J4O4j3wYARhLb8in8zwODesH4PkJvnsvkI26lX+Rz/cfjFtMrfKubmuxXqi/TVmsN62IckPDzX3DZ3SlyFShOrQyfiN2xfSvdqmnTyg3yiv/vIAzglx6Ebhpjy7KR/V5z0hWtuFmSha/iBH90y9oavUCMGJl8TlHRHANZ8fgLudew8hnsG3UCHSTx8EO0WTk9UJ2ifOu3LkT3geJukgQs28njfeW902k0SpuZ11MwggoOxVU4n9fg9NTXLe/3IP0dHfqXjApDJMoUeLi28vrUPXyPTS6wjd8j9hVxdCppxcNK0WjbQDnZ6ZPZ1HOCbvn4HH4XFqnBJANSNenhRMvJe9cToHcaQn2E3f2xDvJUGC/c2ySWBb1guKxCePeDR7DKiQLH9/O0zfR+wuYj67Ml3gcIzZI4d6LqgY0S96tUqhnEjtXIZ66/JpLTe4bXECoUMOXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199024)(186009)(1800799009)(6666004)(6512007)(6506007)(6486002)(2616005)(1076003)(107886003)(2906002)(5660300002)(86362001)(36756003)(4326008)(38100700002)(82960400001)(45080400002)(54906003)(8936002)(41300700001)(66946007)(66556008)(66476007)(8676002)(316002)(966005)(478600001)(83380400001)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2BrmfEQ/qRzjuy+4LmIJKI2oCwyMW2nghrxKu5HjdjHnzMbbZ7uZG2CPykPL?=
 =?us-ascii?Q?HL/kR9Re3EibOpzDPaU08U1cg0x2RD5XZ9AmGpwmjqUDdpxAlYVrpOTMjVN+?=
 =?us-ascii?Q?kwKdXCzgII7SLVQEJNCL3lCM9OQMYWGAXqEFPEFlvQBPBLYpA1lb6pgPbTR7?=
 =?us-ascii?Q?W+gqkPlliaG9bXR9dhrJA5VxkFnu9lIHPV8puEBvy35AR0GNdelIX+Jzxp7A?=
 =?us-ascii?Q?pCOFskCdGYd4KmWTh7p0SGL+FCcaRjHub/fD3RXhtmkJdAPPsJO9UtWGeQli?=
 =?us-ascii?Q?k05s8oRuCQHqNXawAtbdNgXcVGFyPcvEeOXdrTGEduGm/U/mrGcUENi/HQ7e?=
 =?us-ascii?Q?dUs2eLAq1VaFHm2r9LRAUBIhIFl/Cy2GFJLfkzLOD4ivWz04NezOTJQ4eOLw?=
 =?us-ascii?Q?hbiLtozXKemWUIoAa8qwrv1ho/HdqgQMGxTiuH/a3OGH6qjRLv0dx7GUXL2N?=
 =?us-ascii?Q?Lu3k67ZQwFWswMhIZd2+jU7WUuSKvN9q6oI8kL7RM9MymA/CPIQ1Yn/4sx/Z?=
 =?us-ascii?Q?8FkSSrF3bTstv+ck2gDvpkkxvQV7I7HO5XkXUM2v/y29NAGTIB93038ZuP2c?=
 =?us-ascii?Q?EkbgMMfD+6RSBNYKHMni1hz0upzfeE01a6QU8NpMVHOn+vBmUrzbvQXcAHVP?=
 =?us-ascii?Q?Cirxa835rA+fiGMIhYYHH5bHkI9M3aofCQ6QgLTClKjsvkWbhml6VzOvByep?=
 =?us-ascii?Q?QNp6g+e/+j+Kq15oFfq5jyE77x/6WSUPmLeofrSm1NA3hYlZDEtQtcVYrZH0?=
 =?us-ascii?Q?oM16REvRKrPDHnI2RH/bxqlX68hESSGUNm7awVw3amj+Qa4N+AvtX/q0vBJf?=
 =?us-ascii?Q?IBddJ6DCaCI6U4JK3TH/3uqGNSyRIDckPYuwzFr/gWkXkUGi8UtQ48iz3r/f?=
 =?us-ascii?Q?EGS2pOf4Jnh5NcoPw2c0SgzX0U+HN6/L3XOVBUO/6GX7L9i+lkj7+vybVSkP?=
 =?us-ascii?Q?J/PrhGbZUx6C8E4OhF/rnLQaxAS5NC+e5+AjObyt4WZvlS/c/Z5vIObFKPh8?=
 =?us-ascii?Q?w2If1QEzbInXoeT7F2+jNbjplyLRk66ll/3eSGaFo0mNULi6e+U+Hq1I1Ubo?=
 =?us-ascii?Q?y5PjivHuevr9p4l+EjlSVfPueXD+7qMd+2By1fJMD1jpCo+ccqdniSCzKwed?=
 =?us-ascii?Q?2nRsGKn/6FwgZaq/w0yBHsdnhfDi9JGr9GP8a4xsiHoskaOibpj0NxzWMsUm?=
 =?us-ascii?Q?Ovuhl4dFwm9GJUVALFkfQZ5yzULRPUreIR5MAsr4hWNSmW2WHnaXLbS+UbVF?=
 =?us-ascii?Q?ipGfnwaGnVeCNoKBoVZ7wUCBBVPEYEQQxbhVcH2BJQw1nPUcfgUg4tdCHy/h?=
 =?us-ascii?Q?MeVf/AcMpPf/Jtmw1SNeeOrTaeUcvaWvMMw9+hMzrOH069n7Q8Yho6IEJYM7?=
 =?us-ascii?Q?8GSv1ij1QbuDwHB9yStshDeX+CoB3p1P+ObTlZ1/gb7uSApHg4yeRSrVFvUr?=
 =?us-ascii?Q?XhzFQcPcMK8/WHa3s4cSXvF7zd+s7euikXhdAIUVyknT981HnoLcpoPqKbjw?=
 =?us-ascii?Q?MkH9bxs1DVwOF53NznlBhNJJwYy2j8abwQr7G1YQZVvdS3xMOGqAhdRcXIA1?=
 =?us-ascii?Q?+cHyIdWHC5iA1uys1IAenzl6aYV1kUaHiSfOjv/lHu1WtpuSJA7gRxEomejO?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0529c8-e381-4eab-00b0-08dba849bd83
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 04:38:07.2024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eko49Zh4iBoh1QXlvf9AgAAHjP1A/YIsAxq4syg/siCnjAMR2GGakiDGnXwapE+jTp2Id+iTiT9ZF9VAJfMEVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



Hello,

kernel test robot noticed "WARNING:at_fs/kernfs/dir.c:#kernfs_remove_by_name_ns" on:

commit: 95a0a69f906c49a1d6ccdcf226e5bda43559548b ("[PATCH] of: unittest: Run overlay apply/revert sequence three times")
url: https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/of-unittest-Run-overlay-apply-revert-sequence-three-times/20230822-182410
base: https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git for-next
patch link: https://lore.kernel.org/all/a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert%2Brenesas@glider.be/
patch subject: [PATCH] of: unittest: Run overlay apply/revert sequence three times

in testcase: boot

compiler: gcc-9
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202308251623.c4668e73-oliver.sang@intel.com



[   24.207339][    T1] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest5/status
[   24.209547][    T1] ------------[ cut here ]------------
[   24.210305][    T1] kernfs: can not remove 'status', no directory
[   24.211312][    T1] WARNING: CPU: 0 PID: 1 at fs/kernfs/dir.c:1658 kernfs_remove_by_name_ns+0x17/0x76
[   24.212833][    T1] Modules linked in:
[   24.213403][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G        W        N 6.5.0-rc1-00023-g95a0a69f906c #1
[   24.214935][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   24.216555][    T1] EIP: kernfs_remove_by_name_ns+0x17/0x76
[   24.217540][    T1] Code: f0 e8 96 d2 e7 ff 8a 55 df 88 d0 83 c4 18 5b 5e 5f 5d c3 55 89 e5 56 53 83 ec 08 85 c0 75 16 52 68 35 75 4f b2 e8 0e fc e4 ff <0f> 0b 58 b8 fe ff ff ff 5a eb 4d 89 4d f0 89 c3 89 55 f4 e8 69 e6
[   24.220332][    T1] EAX: 0000002d EBX: ed6ed158 ECX: 00000000 EDX: 00000002
[   24.221538][    T1] ESI: 00000000 EDI: 00000216 EBP: b42f7d88 ESP: b42f7d70
[   24.222665][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010246
[   24.223933][    T1] CR0: 80050033 CR2: ffddb000 CR3: 02f04000 CR4: 00040690
[   24.225140][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   24.226298][    T1] DR6: fffe0ff0 DR7: 00000400
[   24.227115][    T1] Call Trace:
[   24.227804][    T1]  ? show_regs+0x49/0x4f
[   24.228595][    T1]  ? kernfs_remove_by_name_ns+0x17/0x76
[   24.229560][    T1]  ? __warn+0x81/0xfe
[   24.230152][    T1]  ? report_bug+0xb0/0x10c
[   24.230975][    T1]  ? kernfs_remove_by_name_ns+0x17/0x76
[   24.231914][    T1]  ? exc_overflow+0x37/0x37
[   24.232734][    T1]  ? handle_bug+0x2b/0x47
[   24.233364][    T1]  ? exc_invalid_op+0x19/0x55
[   24.234248][    T1]  ? handle_exception+0xfd/0xfd
[   24.235098][    T1]  ? exc_overflow+0x37/0x37
[   24.235877][    T1]  ? kernfs_remove_by_name_ns+0x17/0x76
[   24.236835][    T1]  ? exc_overflow+0x37/0x37
[   24.237662][    T1]  ? kernfs_remove_by_name_ns+0x17/0x76
[   24.238667][    T1]  sysfs_remove_bin_file+0xf/0x11
[   24.239383][    T1]  __of_sysfs_remove_bin_file+0x11/0x1c
[   24.240341][    T1]  __of_update_property_sysfs+0x1e/0x2d
[   24.241249][    T1]  __of_changeset_entry_apply+0x150/0x15a
[   24.242221][    T1]  __of_changeset_apply_entries+0x1b/0x65
[   24.243185][    T1]  ? overlay_notify+0x37/0x81
[   24.243954][    T1]  of_overlay_fdt_apply+0x3e3/0x463
[   24.244827][    T1]  overlay_data_apply+0x5c/0x94
[   24.245635][    T1]  of_unittest_apply_overlay+0x18/0x54
[   24.246690][    T1]  of_unittest_apply_revert_overlay_check+0x57/0x142
[   24.247934][    T1]  of_unittest_overlay+0x2b1/0x8bc
[   24.248801][    T1]  of_unittest+0xcaf/0xcf5
[   24.249537][    T1]  ? sched_clock_noinstr+0x8/0xc
[   24.250258][    T1]  ? of_unittest_changeset+0x838/0x838
[   24.251123][    T1]  do_one_initcall+0x6a/0x1a5
[   24.251928][    T1]  kernel_init_freeable+0x17a/0x1c9
[   24.252774][    T1]  ? rest_init+0x140/0x140
[   24.253396][    T1]  kernel_init+0x12/0xf8
[   24.254130][    T1]  ret_from_fork+0x19/0x24
[   24.254890][    T1] irq event stamp: 2494581
[   24.255636][    T1] hardirqs last  enabled at (2494593): [<b1067cf6>] __up_console_sem+0x3d/0x52
[   24.257029][    T1] hardirqs last disabled at (2494604): [<b1067cd9>] __up_console_sem+0x20/0x52
[   24.258525][    T1] softirqs last  enabled at (2494484): [<b1e9fe62>] __do_softirq+0x2aa/0x2d8
[   24.259940][    T1] softirqs last disabled at (2494473): [<b1008ef8>] do_softirq_own_stack+0x2a/0x30
[   24.261703][    T1] ---[ end trace 0000000000000000 ]---
[   24.262682][    T1] ### dt-test ### FAIL of_unittest_apply_revert_overlay_check():2167 overlay_5 failed to create @"/testcase-data/overlay-node/test-bus/test-unittest5" disabled
[   24.265226][    T1] ### dt-test ### EXPECT / : OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest5/status
[   24.265263][    T1] ### dt-test ### EXPECT \ : OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest6/status
[   24.267833][    T1] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest6/status
[   24.273345][    T1] ### dt-test ### EXPECT / : OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest6/status
[   24.273352][    T1] ### dt-test ### EXPECT \ : OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest7/status
[   24.275907][    T1] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest7/status
[   24.281335][    T1] ### dt-test ### EXPECT / : OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data/overlay-node/test-bus/test-unittest7/status



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230825/202308251623.c4668e73-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

