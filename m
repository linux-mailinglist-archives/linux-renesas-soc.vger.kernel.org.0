Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A495025D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Apr 2022 08:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350782AbiDOGsm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Apr 2022 02:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350811AbiDOGse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Apr 2022 02:48:34 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8255BB53D7;
        Thu, 14 Apr 2022 23:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=0GMCl4FT7i83gQyY/lyNePAQBYdHzfcz8xZ5oYWUOPs=; b=KQ7LnthuGiA11srXZ/gBIINT9P
        ZPEy+pg4ZpBUB7M8tgOFaD4pdbYF3gpRGBWNJAFL9Ah40w8Wqy+Cu2b2fzazJlPdOUUqzNQjOEZlT
        lyvJ/LbdaP3Df969G92anDGVZ9eg6hoG2Pk9v8W1V55qnsouQPebU5/KWO776LIc/bPt1Zy3T8yYV
        LTAN9C6MiXg5krIhJqK70F6s3KfW512dQ1TXQJFrnXutZ+WiRgzHC3xFAzwmZwgh6l7bTwac8Ofzz
        5eA7DeyAi4ZXVOK+c1OiNj3JEDKHhnhje8ada5SSflX8OGrUt59/UHWk6UhgftpudwgOjbp7rEB21
        Ss3t5pVQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nfFiN-0095x3-33; Fri, 15 Apr 2022 06:45:55 +0000
Date:   Thu, 14 Apr 2022 23:45:55 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
Message-ID: <YlkUo5fK2cFOCsAI@infradead.org>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
 <20220412073647.3808493-3-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412073647.3808493-3-yoshihiro.shimoda.uh@renesas.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 12, 2022 at 04:36:42PM +0900, Yoshihiro Shimoda wrote:
> Add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS for a broken host controller
> of the 64-bit addressing supported capability.

Why can't you just clear MASK_64_ADDRESSING_SUPPORT for this case?
