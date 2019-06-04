Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1714C350FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 22:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfFDUcW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 16:32:22 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:60108 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbfFDUcV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 16:32:21 -0400
X-Greylist: delayed 1357 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Jun 2019 16:32:21 EDT
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x54K3N4t016841;
        Tue, 4 Jun 2019 16:09:27 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap02.intersil.com with ESMTP id 2sukhdjn39-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 04 Jun 2019 16:09:26 -0400
Received: from pbmxdp02.intersil.corp (132.158.200.223) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Tue, 4 Jun 2019 16:09:25 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Tue, 4 Jun 2019 16:09:24 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] dts: rza2mevb: Add IRQ pin controller for RZ/A2
Date:   Tue, 4 Jun 2019 15:09:12 -0500
Message-ID: <20190604200914.64896-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-04_12:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=800
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906040127
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The IRQ pin controller that was added for RZ/A1 is the exact same
one that is in RZ/A2. So we only need to add it to the device
tree.

Tested on the RZ/A2M EVB board (after gathering all the appropirate
patches from different maintainer trees)


Chris Brandt (2):
  ARM: dts: r7s9210: Add IRQC device node
  ARM: dts: rza2mevb: Add input switch

 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 20 ++++++++++++++++++++
 arch/arm/boot/dts/r7s9210.dtsi         | 19 +++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
2.16.1

