Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F11330B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 15:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbfFCNL5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 09:11:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58396 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfFCNL5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 09:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=tt6BJAYaxrNmu3et796NxiC2q8/CjHMVVu6JBQ4VKOM=; b=KaWmZacyzCx3dkZCrIuDZ1tDZ
        BHUXC3c+RjO0tz6dSrFkJCGokaf/Zsygkdpm3QoqOkH68wPemKn78+Iy5vpT5SfULBjXbh7hkeOPG
        SKvvbc14+1KcY0ZBOudUKCjGztMVubdp9Dtww6OYZV0A2wwh1OcDo6vlkgieOvEWEDUKLDrb3H4Nq
        3HEkRrDFjkS+6n4UMvIOPRc2QikBfQN5PddBY6k6/HJSE9Y1NOhEVlBstuPt2VigPz0TMspuql3q+
        9DmWiuatDB8rHfOp+ZGG4vDbRwEw9aSa9jVWPAy+TFsbd+tryLxF/gsoWz2d04vzW54p5Ad5m3InS
        a38Cgsj2w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hXmkh-0001e1-TJ; Mon, 03 Jun 2019 13:11:51 +0000
Date:   Mon, 3 Jun 2019 06:11:51 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christoph Hellwig <hch@infradead.org>, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mmc: renesas_sdhi: improve performance by
 changing max_segs
Message-ID: <20190603131151.GA6147@infradead.org>
References: <1559301371-21200-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190603125701.jkmpkvctrtlj2io7@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603125701.jkmpkvctrtlj2io7@ninjato>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 03, 2019 at 02:57:01PM +0200, Wolfram Sang wrote:
> Yes, dropping my rev on patch 3 is a good thing to do. I added Christoph
> to the CC list because he gave valuable input last time.

Assuming iommu merging in a driver using the DMA API is always bogus
as mentioned last time.  As this cover letter don't seem to include
any higher level DMA subsystem or block changes I'll stick to my NAK.
