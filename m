Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F0F4476F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 18:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729959AbfFMQ7k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 12:59:40 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41150 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729820AbfFMQ7k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 12:59:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5DGrg6a146672;
        Thu, 13 Jun 2019 16:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=VB7BbCcx5CDFsG6/AylvYiYZjuNghhK4GPV3gIX6IgY=;
 b=JM/zm087RQdix9tjZYqwsKtsL1r4oeg4m549rL34vFP7V7snV+V6jkMW32K6cszyFqwA
 4LAwbnYI7oNx6Cder0IYcyRig+6l/D5XoXA1WNj3W3i4BZ6SS9JNcU2+U4sz9Ilx21RF
 m9yWqSzUQgzoMdBE7yH3XIoto5guc4o8ijARvGbDVEAkV33NZnSKZyPhcunGnyQZOg6D
 gntIMHlm0W9RMbH9YcXv5nmx02cXJu4f8UcMUE/CPLCoFNupiHRYByCja362NG3+UA64
 L3pcrl3it7g9J2N2cGoPCK+Lkrsj/lr1/Q03zQibiuskhzmeOuF3NAuinosmwPYef5Ov hA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2t05nr2uea-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Jun 2019 16:59:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5DGuroV168293;
        Thu, 13 Jun 2019 16:57:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2t1jpjnsf2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Jun 2019 16:57:26 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5DGvOZm008225;
        Thu, 13 Jun 2019 16:57:24 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 13 Jun 2019 09:57:23 -0700
To:     Christoph Hellwig <hch@lst.de>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        "iommu\@lists.linux-foundation.org" 
        <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block\@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190612120653.GA25285@lst.de>
        <Pine.LNX.4.44L0.1906121038210.1557-100000@iolanthe.rowland.org>
        <20190613073900.GC12093@lst.de>
Date:   Thu, 13 Jun 2019 12:57:21 -0400
In-Reply-To: <20190613073900.GC12093@lst.de> (Christoph Hellwig's message of
        "Thu, 13 Jun 2019 09:39:00 +0200")
Message-ID: <yq14l4ttocu.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=655
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906130122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9287 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=707 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130123
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Christoph,

> sd.c only supports a few specific sector size, and none of them is
> < 512 bytes:

Yep, while sd.c in theory supported 256-byte logical blocks a while
back, that code was removed since the block layer always operates on
units of 512 bytes.

-- 
Martin K. Petersen	Oracle Linux Engineering
