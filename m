Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DCF382C93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 14:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237151AbhEQMwJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 08:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237148AbhEQMwH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 08:52:07 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AB7C061573
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 05:50:49 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id t15so6713083edr.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Z1/Njy8LK/EJ/W56xjdiHLiOoov7Bf4adkv7qRxfBug=;
        b=VWs0pUbh1QGQ/fGVHxHKsULbWEvX+kPgKRvGVtgBsHA2e29WjTnPU/JZ194O/61FvE
         cM+ccMkP3h08is6cHJV5vKIOhh2tz3Bpbb4+PDglCSFdfiZi7lwPk4iaGL7kIH+wwfOk
         C2xLcAvYrKlIWj6uFkrRMLdnU6U63BpXY1JspZ8bSRYDmYQ3doIGK1tyIY1VlVN+jWGE
         I1fJkNB2hsz/saA+MaWGUFIB6+Z9vBxeKzgZnF8MtUrGzo/U18i0WydmTgsTC2zWDu6Z
         54IyT+e9JKaAP6xJxlyzhBlVOVoar/uUwu3UbGEZdZmZxivHama35oHHJ6xY2HxSrB3J
         yUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Z1/Njy8LK/EJ/W56xjdiHLiOoov7Bf4adkv7qRxfBug=;
        b=KoO0+V4jYFOuVOz7Mnyv0C/32ekQ0A8B0/mgE+3SyzWFROo3qE55MeMKyVhE8Bz8HV
         qYtcRb87fKtxl43WYCtGn3ncxIb7AohHaL/Wu7kw+5RkqePA8bWVcj21E/VPKhOnIqIZ
         sMTjKFl7g9R/KBXyOHfer4AvgY/6DTq95QVZ19aBtv+CDdo1hPSwau44oIbmqdOmdGhM
         ysr0KDsgctqUOLQfju18/QrVlSt4kw5ScTBZXWaRaPJVkDWC5PyqkPdV6juOfTiC14HF
         Aq7b1GCsZtu6CkeO6eFIB7VB34FPX1e4BXEn8vcllyVXZbS4B34gbLrqlHudYqQwecuK
         r5zg==
X-Gm-Message-State: AOAM531MSE5Xf43Ijzk/kXKCuZT5fser8I/8Ig73nR2wxR0HL4B/OiLj
        8lRyZgnf/UE6Dzr4fcYxu/hTHpPahDqOzXdcb3uldh3Rv80=
X-Google-Smtp-Source: ABdhPJwDgaZBNlTGwY8eZnfI1xuOiKgFXMaB9++i4BTwEAAfbPXj/7cOfu25AZCP0OvW/UdIgCf1RSQnAQg+PGNcSYw=
X-Received: by 2002:aa7:cb84:: with SMTP id r4mr71803631edt.187.1621255847708;
 Mon, 17 May 2021 05:50:47 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 17 May 2021 07:50:36 -0500
Message-ID: <CAHCN7xKjHramQ=p74+jtLP0vV6=cTjMv-b7ad83W3R50aWc=rQ@mail.gmail.com>
Subject: RZ/G2 Lossy Compression Memory Question
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The bootloader/TF-A configuration we're using is based on the 4.19 CIP
kernel that Renesas released.  TF-A, we allocate some memory for the
lossy compression and this memory is not available for Linux.  I'd
prefer to not have to use a special TF-A for the mainline Linux, but
what appears to be happening is that Linux doesn't know about the
reserved memory, so memory corruption happens.

The Renesas CIP kernel uses the following to define the space

/* device specific region for Lossy Decompression */
lossy_decompress: linux,lossy_decompress@54000000 {
     no-map;
     reg = <0x00000000 0x54000000 0x0 0x03000000>;
};

Then uses the following to carve it out so Linux doesn't think it can use it.

mmngr {
     compatible = "renesas,mmngr";
     memory-region = <&mmp_reserved>, <&lossy_decompress>;
};

Unfortunately, renesas,mmngr doesn't exist upstream.

I thought about changing the memory node to break it up, but it seems
like a hack.

What is the best suggestion for blocking this memory area from Linux
while still appearing to show the full memory size?

adam
