Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1C1B7CD383
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 07:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjJRF1G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 01:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjJRF1F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 01:27:05 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB3EBA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Oct 2023 22:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=+MvGJJXhH4hDoZHgxYXrLlkhJ9bNdcq3APvPvNhBj6I=; b=0JBDloiYtUQvG0nqd+zYT2kuDH
        7Q2zBuf2fePZHWtRIg+1RXcMXeSJofqfQZXA5tGHKbp9C3CT+TyQl6A7j4XvfhMMOeGxx5QoJ1OTw
        jOT6LgvA3Sta5xFE34SwDvGhhkPyDT4MvAYjDL0K3nY1/YHmglr/XO+yIAgped5c62zAfReAvNM3z
        NtME5/MmCesFUasl/wFoKGYlWnx79CDM8tYOY60VzyBMBqLobqTvV2kgBwfUMMRxtmve6icZ5uC09
        dk0BbuSAKMdrNcPdEU+dqdz3dEN9Gxla5W/+DvQ6QJ5OwqBNeQaxg194fFQ1Zg8pagqtE+fRcMHtL
        7QhT7R7w==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qsz57-00Dp2u-0t;
        Wed, 18 Oct 2023 05:26:57 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Samuel Holland <samuel.holland@sifive.com>, soc@kernel.org
Subject: fix a few RISC-V / renesas Kconfig dependencies v2
Date:   Wed, 18 Oct 2023 07:26:51 +0200
Message-Id: <20231018052654.50074-1-hch@lst.de>
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

Changes since v1:
 - select DMA_DIRECT_REMAP from ERRATA_THEAD_CMO
