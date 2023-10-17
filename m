Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1CD7CC55D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 15:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343900AbjJQN7k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 09:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343571AbjJQN7j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 09:59:39 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CDFFD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Oct 2023 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=m96cL5ijSpQsuieIaiYXP7bFvbIGAJf7RX0A75YE944=; b=q84ISQwQm0u2TmDb443jW9Z9II
        CKdsgxK59BOKYODsMdscZgn+LE5O6s/dLLGKzclFAx6YqkN8/rjkoMyhagyG9Fjtbx8kAf/MbvOSU
        o2E3t1IWgnh+encep32oQu1f5aLTA3TNq2II2/MbK7gqGrUtTd+1qL1gWOL3mJN9I3D7D1LujM4r5
        +x8d87QfoKW8WuFhJPsJOh7J6zsM25gu73qMYqaHAz7+iBWf4zzVSyxtiqApDLEpD63BpfmMcazkf
        VwVF5ACw8OeM5rap0aTeegPzwDJwEP5OgmnMcCzl7bIonGiKWJBMWUXZGNsvU/X8EemUBgKuf8bIX
        Tk+0G9Ew==;
Received: from 213-147-166-120.nat.highway.webapn.at ([213.147.166.120] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qskbb-00CTWK-0I;
        Tue, 17 Oct 2023 13:59:32 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org
Subject: fix a few RISC-V / renesas Kconfig dependencies
Date:   Tue, 17 Oct 2023 15:59:23 +0200
Message-Id: <20231017135926.1240101-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi all,

this small series sorts out a few Kconfig dependency issue for the
rich set of RISC-V non-coherent DMA support.

Geert suggested for it to go into the soc tree, which is fine with me
if I get a stable branch for it as it is required for further dma-mapping
work.
