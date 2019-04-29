Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4BBDC58
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 08:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfD2G4W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 02:56:22 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34114 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id h5so7113697lfm.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Apr 2019 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VJJi56/HZ5V47wHMOB68GGHfM+IJiPYGQuykcymneFU=;
        b=q2x4/qdloWFkr7+P5f1rN/iwg13vpNfm88NImAAgWc0Yc7g09VR+UJQavb/lsAi/f5
         8pe34UdgzPP9cNCzNCS7VTBZBkPpEMBda29t92vO0TyZdi9bJQckPgoVJys0zZ4aLiJp
         qdDAjNqf+JWlvyDxoS1Y01/2Bpp4l2ka7qGtXMQegfKuY40RNKAYUQ//o6Pb9TY5NR96
         Ug4d7mJGECp1u7HJqWzokwjpTgxwhQkxgIA9rNuvxcPxxBs+JBSNcigqsdp/WJKgZwg3
         RD3STHJOHLQ1LrkcQibnMksParE5UTj+MmFWgwjr7XEp0AOFavSTCTn1d4HNsyAFtiVj
         Tspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VJJi56/HZ5V47wHMOB68GGHfM+IJiPYGQuykcymneFU=;
        b=pVrZQFlVkxAEQ/4CTdOpC6+7SjWXTfsxWMm9o0Ofj35BEOP4w9nGulQqlOvnnG63hE
         Zb8vt+c4xOKmzUMINuF+e0F/ZlXSMPYg1dhAOs980fySYWh/tTtqZeDgvLr72ENP6I4c
         ihINxSFfwSRQdKxrsdNTTyhBOqh304YRWpX67BryG5fnIHMICuiuBR5JUgW+d5DnkpjU
         DhBGX1l+AYQnNrcNjYMvexi5/4L4VThexgPm103yMr0S84V5kSZbcpfouPpC/KtsWdFi
         m/d6ztM4pO0Guq4Y6mJ3IEFSaw6Up2aWFQymi8E2eeq1dP8Y4XW5eiY8ndFjufmbJCRc
         t2Mw==
X-Gm-Message-State: APjAAAWdczxUyjhWTtw7C8nJwBIBYZP5CuAI3hfL8eMyoBCqs/bG3wsq
        +Yr3JJpsgqaCE4cwu22bZY+L7Q==
X-Google-Smtp-Source: APXvYqyD+sfrJfFg/jQ0CO1sGbdugzizlS2mx4CJJOT8Z2lxBo8Fif4GrL3U9kG1AuUb178UzuM/nQ==
X-Received: by 2002:ac2:5181:: with SMTP id u1mr16932721lfi.59.1556520980309;
        Sun, 28 Apr 2019 23:56:20 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id f15sm7176286lfa.89.2019.04.28.23.56.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:19 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:40:48 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.2
Message-ID: <20190429064048.axooxum55qabfkdn@localhost>
References: <cover.1555683298.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1555683298.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 19, 2019 at 04:35:07PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC updates for v5.2.
> 
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-soc-for-v5.2
> 
> for you to fetch changes up to 115bbc30c6d2d7c8eddf87f88c1b7033522d47d2:
> 
>   ARM: shmobile: fix a leaked reference by adding missing of_node_put (2019-03-18 10:32:36 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Updates for v5.2
> 
> * Power Management
>   - Fix a leaked reference by adding missing of_node_put
> 
> * R-Car M2-W (R8A77910) based Porter board
>   - Enable regulator quirk

Merged, thanks.


-Olof
