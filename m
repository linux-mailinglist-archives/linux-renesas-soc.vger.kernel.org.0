Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A3E168BBF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2020 02:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgBVBmU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 20:42:20 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:52220 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726842AbgBVBmU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 20:42:20 -0500
Received: from gwarestrin.me.apana.org.au ([192.168.0.7] helo=gwarestrin.arnor.me.apana.org.au)
        by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
        id 1j5Jnu-0002wa-Bq; Sat, 22 Feb 2020 12:42:03 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Sat, 22 Feb 2020 12:42:02 +1100
Date:   Sat, 22 Feb 2020 12:42:02 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Gilad Ben-Yossef <gilad@benyossef.com>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/34] crypto: ccree - miscellaneous fixes and
 improvements
Message-ID: <20200222014202.GD19028@gondor.apana.org.au>
References: <20200211181928.15178-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 11, 2020 at 07:18:54PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This series contains several fixes, cleanups, and other improvements for
> the ARM TrustZone CryptoCell driver.
> 
> The first 3 patches have been sent before:
>   - [PATCH 0/2] Fix debugfs register access while suspended[1],
>   - [PATCH] [RFC] crypto: ccree - fix retry handling in
>     cc_send_sync_request()[2.
> 
> This is based on v5.6-rc1, with the following fixes from Gilad applied:
>   - [PATCH 0/4] crypto: ccree - fixes[3],
>   - [PATCH] crypto: ccree - dec auth tag size from cryptlen map[4].
> 
> This has been tested on R-Car H3 ES2.0.
> To ease testing, I have pushed this series and its dependencies to the
> topic/ccree-misc-v2  branch of my renesas-drivers repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> 
> Thanks for your comments!
> 
> [1] https://lore.kernel.org/r/20200124132957.15769-1-geert+renesas@glider.be/
> [2] https://lore.kernel.org/r/20200128190913.23086-1-geert+renesas@glider.be/
> [3] https://lore.kernel.org/r/20200129143757.680-1-gilad@benyossef.com/
> [4] https://lore.kernel.org/r/20200202161914.9551-1-gilad@benyossef.com/
> 
> Geert Uytterhoeven (34):
>   debugfs: regset32: Add Runtime PM support
>   crypto: ccree - fix debugfs register access while suspended
>   crypto: ccree - fix retry handling in cc_send_sync_request()
>   crypto: ccree - remove unneeded casts
>   crypto: ccree - swap SHA384 and SHA512 larval hashes at build time
>   crypto: ccree - drop duplicated error message on SRAM exhaustion
>   crypto: ccree - remove empty cc_sram_mgr_fini()
>   crypto: ccree - clean up clock handling
>   crypto: ccree - make mlli_params.mlli_virt_addr void *
>   crypto: ccree - use existing helpers to split 64-bit addresses
>   crypto: ccree - defer larval_digest_addr init until needed
>   crypto: ccree - remove bogus paragraph about freeing SRAM
>   crypto: ccree - use u32 for SRAM addresses
>   crypto: ccree - simplify Runtime PM handling
>   crypto: ccree - use of_device_get_match_data()
>   crypto: ccree - remove cc_pm_is_dev_suspended() wrapper
>   crypto: ccree - make cc_pm_{suspend,resume}() static
>   crypto: ccree - remove struct cc_sram_ctx
>   crypto: ccree - remove struct cc_debugfs_ctx
>   crypto: ccree - remove struct buff_mgr_handle
>   crypto: ccree - remove struct cc_cipher_handle
>   crypto: ccree - extract cc_init_copy_sram()
>   crypto: ccree - remove bogus kerneldoc markers
>   crypto: ccree - improve kerneldoc in cc_hw_queue_defs.h
>   crypto: ccree - improve kerneldoc in cc_buffer_mgr.c
>   crypto: ccree - improve kerneldoc in cc_hash.[ch]
>   crypto: ccree - improve kerneldoc in cc_request_mgr.[ch]
>   crypto: ccree - improve kerneldoc in cc_sram_mgr.[ch]
>   crypto: ccree - spelling s/Crytpcell/Cryptocell/
>   crypto: ccree - grammar s/not room/no room/
>   crypto: ccree - use existing dev helper in init_cc_resources()
>   crypto: ccree - use devm_k[mz]alloc() for AEAD data
>   crypto: ccree - use devm_k[mz]alloc() for cipher data
>   crypto: ccree - use devm_kzalloc() for hash data
> 
>  drivers/crypto/ccree/cc_aead.c          |  61 +++---
>  drivers/crypto/ccree/cc_buffer_mgr.c    |  66 +++---
>  drivers/crypto/ccree/cc_buffer_mgr.h    |   4 +-
>  drivers/crypto/ccree/cc_cipher.c        |  61 ++----
>  drivers/crypto/ccree/cc_debugfs.c       |  29 +--
>  drivers/crypto/ccree/cc_driver.c        | 127 +++++-------
>  drivers/crypto/ccree/cc_driver.h        |  13 +-
>  drivers/crypto/ccree/cc_hash.c          | 225 +++++++++------------
>  drivers/crypto/ccree/cc_hash.h          |  31 ++-
>  drivers/crypto/ccree/cc_hw_queue_defs.h | 255 ++++++++++++------------
>  drivers/crypto/ccree/cc_pm.c            |  60 +-----
>  drivers/crypto/ccree/cc_pm.h            |  21 --
>  drivers/crypto/ccree/cc_request_mgr.c   |  47 +++--
>  drivers/crypto/ccree/cc_request_mgr.h   |  19 +-
>  drivers/crypto/ccree/cc_sram_mgr.c      |  78 +++-----
>  drivers/crypto/ccree/cc_sram_mgr.h      |  45 ++---
>  fs/debugfs/file.c                       |   8 +
>  include/linux/debugfs.h                 |   1 +
>  18 files changed, 456 insertions(+), 695 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
