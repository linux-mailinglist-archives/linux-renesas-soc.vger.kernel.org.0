Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 542E154FB2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 15:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbfFYNEd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 09:04:33 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38057 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728449AbfFYNEc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 09:04:32 -0400
Received: by mail-lf1-f66.google.com with SMTP id b11so12602152lfa.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2019 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E0WVPESqitHtnwVEO8ENtoD+KDQQJwVcJRqu49CfcI0=;
        b=LkV0XqFe9JldWfAXCRgTPsBw4G71SdcC8K/xQ8lQWLIO5wfSGtgERxzXU63qwWR/KR
         K5tpHiV9V+n6BLlcZ0JD3z8lqi44U3u9qu3t/yLhODXGmp7Zau152ashDMNxzoAC7J0U
         kK9wvyQ9G54sv3ZQjIc8MV42MHEAajEijAsFXiXarhxyo9PKF3rOdmR4ppGXp8WvhZyy
         gLWutEYQBiuWUbs9aFfidlH1AETCOi/1znDbNyiDZ4/Su72t+Z1KcRi4fgiFy12y9aBr
         P2KErkHAWSFpqlU4R0iAH/llagiHk9yFcd8RheAyN1vlRjebcSUJQs80dScz2C8aGqfR
         gv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E0WVPESqitHtnwVEO8ENtoD+KDQQJwVcJRqu49CfcI0=;
        b=bcvbG+RHDDJGMKHQia/8ggyEg4o/Z+OwI7H4VdjxH1i4oOYLwQF5UCcM1XI1jKY9VI
         5yi20XmbFlD+1eSqGD8wwMPEUPzfG7l4L5Xyad+CSzNccaW3XPCevIxqfd8wc8JIS5Xb
         LNBBA/PQZP2S1RDDxE/j6R8DsvTWnsrQkBufJgvAVq+JuVUZ26ZNkES7DzpA7lHJFXBj
         nWcHRhwQ76rxscQdo9zlC2eL2bqW5ZQIaxX1RSGwOvkdC2W5e3HMQ11uE0+rrlq1Fi1J
         G+Ct8r9OAPqTFIjoXG4GYlAcJGsN8HtntRAbhyV+YcBp70ks2oMFkm3DAVtE3n+1KU5p
         rhag==
X-Gm-Message-State: APjAAAWe4b/I90VVkmggy2iOC4cEv9nhk7gZEczp9IQYNmz6lteXMP3Q
        SyOLqA8D4wSxixrM55XwOSWC9w==
X-Google-Smtp-Source: APXvYqzzLTsSme3uT4viyUDPKUNkYrfspoce7Jz7uazKE3ifrjOJMuWlOYQZiBszxxk0b0ChJIXPmQ==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr45478464lfq.136.1561467871183;
        Tue, 25 Jun 2019 06:04:31 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id z30sm2246595lfj.63.2019.06.25.06.04.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:04:30 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:17:53 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v5.3
Message-ID: <20190625121753.hoytepbhapg55ed5@localhost>
References: <cover.1561105600.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1561105600.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 11:16:41AM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC defconfig updates for v5.3.
> 
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v5.3
> 
> for you to fetch changes up to c24f6886b2ee321b50543d3683573689a1817336:
> 
>   arm64: defconfig: enable TYPEC_HD3SS3220 config option (2019-06-12 13:57:08 +0200)

Merged, thanks!


-Olof
