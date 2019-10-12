Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E8DD4D45
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Oct 2019 07:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfJLFtR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Oct 2019 01:49:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:32948 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbfJLFtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Oct 2019 01:49:17 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 13C9A25B7C7;
        Sat, 12 Oct 2019 16:49:15 +1100 (AEDT)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 9C68CE20369; Sat, 12 Oct 2019 07:49:11 +0200 (CEST)
Date:   Sat, 12 Oct 2019 07:49:11 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove Simon as Renesas SoC Co-Maintainer
Message-ID: <20191012054907.nxqmuuwzgpydkk2o@verge.net.au>
References: <20191010123046.15291-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010123046.15291-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 10, 2019 at 02:30:46PM +0200, Geert Uytterhoeven wrote:
> At the end of the v5.3 upstream kernel development cycle, Simon stepped
> down from his role as Renesas SoC maintainer.
> 
> Remove his maintainership, git repository, and branch from the
> MAINTAINERS file, and add an entry to the CREDITS file to honor his
> work.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Simon Horman <horms@verge.net.au>

> ---
>  CREDITS     | 4 ++++
>  MAINTAINERS | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/CREDITS b/CREDITS
> index 8b67a85844b55d88..031605d46b4d5cc1 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -1637,6 +1637,10 @@ S: Panoramastrasse 18
>  S: D-69126 Heidelberg
>  S: Germany
>  
> +N: Simon Horman
> +M: horms@verge.net.au
> +D: Renesas ARM/ARM64 SoC maintainer
> +
>  N: Christopher Horn
>  E: chorn@warwick.net
>  D: Miscellaneous sysctl hacks
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 94ce075907a0b9aa..d44d6732510df746 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2165,12 +2165,10 @@ F:	arch/arm64/boot/dts/realtek/
>  F:	Documentation/devicetree/bindings/arm/realtek.yaml
>  
>  ARM/RENESAS ARM64 ARCHITECTURE
> -M:	Simon Horman <horms@verge.net.au>
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  M:	Magnus Damm <magnus.damm@gmail.com>
>  L:	linux-renesas-soc@vger.kernel.org
>  Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
>  S:	Supported
>  F:	arch/arm64/boot/dts/renesas/
> @@ -2282,12 +2280,10 @@ S:	Maintained
>  F:	drivers/media/platform/s5p-mfc/
>  
>  ARM/SHMOBILE ARM ARCHITECTURE
> -M:	Simon Horman <horms@verge.net.au>
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  M:	Magnus Damm <magnus.damm@gmail.com>
>  L:	linux-renesas-soc@vger.kernel.org
>  Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
>  S:	Supported
>  F:	arch/arm/boot/dts/emev2*
> -- 
> 2.17.1
> 
