Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E303DC57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 08:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfD2G4U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 02:56:20 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40144 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id t10so7260337ljg.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Apr 2019 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pHFTWPg+Y3/O+ts5Ha/EUTxNy0aVtLYdXZeSPiCHoEk=;
        b=SgNEe81DscetE5N9Q277xVmP67DbZZDlKCDfBvsRdZuqrQZZbGriTiPIvf4y2nzkN7
         v30pQ0oq4Sqh12qEwKVBdrbSbD7zT/Jrm6meVrMkZORKfgSp1a8QS7VamWgqh4DLUJbp
         XoqG3K1KhHCzy84RSJSSVZcVUUBgRhQEggttdQX4HKKXVJnAWWHZirKn3rNxmGxUf1mm
         o3Bsjz1pntCt0n66LopXoeEDzQmypPSKxhzhGU/4p4n5NpRjSla8W5Md0kc8CrGl7Bz8
         YkAr5B/6xqm4f17U86jcMrEuhVRqAzeE6xv99sLrkNqSUtKrsCacRdPmhLnEWqGBMo3g
         drEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pHFTWPg+Y3/O+ts5Ha/EUTxNy0aVtLYdXZeSPiCHoEk=;
        b=EDclHJFLj53eLhdQ+s4C4M84eA5DfjQYB8mLDaefdxEOB5LVGnRofjzZ5Gzh+C1wJS
         HYRA3cin/y3OqFyxI0LLhIhJZv6OuJRrzwOKqJPSmw3rX+n1A6GTdqDarcLDiZX3FGko
         pwMoMmEFgdJHT9Mjm4yrHBQ0nawXZmNDZEi4H7kOo2Qzj4P3pGzqH2gjiN/BBgMFQ2SV
         +4VvWZc8+Ovrh7FyxerYAKNPUkV0l4PC2XNpSRYPWJRn7n8drphvWF37ZQM5wcqFFNAy
         0qflMZBn8sMUPEMpqoFFLJndONwkd6t2SDAA+kFqakEWh2bKmHcvftaAMyU35MmgEjeD
         kuHQ==
X-Gm-Message-State: APjAAAVkBI/mVcVVJanUwZJcVAIerTUl/VF5UlrUMuHoNWQrdJcdQDll
        PasXUK9KuAAVo9PY/UznCVg4xA==
X-Google-Smtp-Source: APXvYqxliAE0cGDimMn886h1GTEFRsKaj0RNCUCOqr1BzQB34pWvGO768SLeP0rONWyD8f3y6Voeiw==
X-Received: by 2002:a2e:8141:: with SMTP id t1mr5991857ljg.122.1556520977970;
        Sun, 28 Apr 2019 23:56:17 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id o79sm7167914lff.50.2019.04.28.23.56.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:16 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:40:27 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v5.2
Message-ID: <20190429064027.loh5nyxn3mttiep7@localhost>
References: <cover.1555654474.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1555654474.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 19, 2019 at 04:34:18PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC defconfig updates for v5.2.
> 
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v5.2
> 
> for you to fetch changes up to b266731b76d5c33c0f6d781c449e43ad9991fb70:
> 
>   ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM support in shmobile_defconfig (2019-04-12 14:16:10 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Defconfig Updates for v5.2
> 
> shmobile and multi_v7 defconfigs
> * Enable support for CFI NOR FLASH
> 
> shmobile defconfig
> * Enable USB [EO]HCI HCD PLATFORM and PHY_RCAR_GEN3_USB2
> * Refresh for v5.1-rc1

Merged, thanks.


-Olof
