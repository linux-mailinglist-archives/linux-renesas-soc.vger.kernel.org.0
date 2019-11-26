Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E398E109C80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2019 11:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfKZKsb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Nov 2019 05:48:31 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:14499 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbfKZKsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Nov 2019 05:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574765309;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=I31bQPpn/vbAjn5TTUO2KRld/rGkuqy8VkI9ImPhBsU=;
        b=TkGBgN7GgqLYbT+U2Nl1Bw4kUt4vDPN320xhSEDZTdviFgPXhio9HZcRWbjtmKExYQ
        b55fmGFn1fUcFvN3j1MgBRNbVl6z/2YIh0E6l9WLbqwsl+YuixVW9ckoFttzSybvvWel
        Bk+F9CFgRiEhNi4VhkAiTlzFfBKB2wycBDn6Ozt24EWPn54037bDUNXMXf5pS5TgY855
        uGnq37pAd6jpg/kulbIdvvs3feCAlhfD7REAVFXF9LqPeKNzjvKMyCfDZYobZOJ+lJbp
        oZg5chLNdKcKkHlfbgJU9MUUIDo5qN35k9jrmqRVDtwteFOdJm4LmvswWwqEq5xuGuqt
        733w==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 45.0.2 AUTH)
        with ESMTPSA id k05717vAQAjP4O5
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 26 Nov 2019 11:45:25 +0100 (CET)
Date:   Tue, 26 Nov 2019 11:45:25 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <1619526348.1354132.1574765125512@webmail.strato.com>
In-Reply-To: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC 0/4] mmc: host: renesas_sdhi_sys_dmac: change
 dma_buswidth
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev22
X-Originating-IP: 112.198.74.215
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On November 22, 2019 at 7:13 AM Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:
> 
> 
> This patch can improve performance when a sd card transfer size
> is multiples of 32 like a sd memory card. However, this may
> disimprove performance when a sd card transfer size is not
> multiples of 32 because this patch uses PIO instead of SYS-DMAC.

I have logged the DMA transfer sizes of a Marvell SD8897 WiFi/BT chip, and there transfers that are not multiples of 32 are infrequent (every second or so) and small (184 bytes); all large transfers are multiples of 32.

Would it be practical to switch the DMA bus width down if odd sizes are encountered, and back up again otherwise?
 
CU
Uli
