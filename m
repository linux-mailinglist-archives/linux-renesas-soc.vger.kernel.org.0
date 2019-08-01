Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55B1B7D5EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 09:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbfHAHAn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 03:00:43 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55174 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfHAHAn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 03:00:43 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 713C725B7DE;
        Thu,  1 Aug 2019 17:00:41 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 096AF9405AE; Thu,  1 Aug 2019 09:00:38 +0200 (CEST)
Date:   Thu, 1 Aug 2019 09:00:38 +0200
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
Subject: Re: [PATCH] MAINTAINERS: Add Geert as Renesas SoC Co-Maintainer
Message-ID: <20190801070034.zxgv3svcpzgbjqwf@verge.net.au>
References: <20190729175658.13672-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729175658.13672-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 29, 2019 at 07:56:58PM +0200, Geert Uytterhoeven wrote:
> At the end of the v5.3 upstream kernel development cycle, Simon will be
> stepping down from his role as Renesas SoC maintainer.  Starting with
> the v5.4 development cycle, Geert is taking over this role.
> 
> Add Geert as a co-maintainer, and add his git repository and branch.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Stephen: Can you please add my branch to linux-next, after Simon's
> 	 branch, which may still receive fixes for v5.3?
> 
> 	 Thanks!
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)

For the record:

Acked-by: Simon Horman <horms+renesas@verge.net.au>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6426db5198f05377..6de667021591fb52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2155,10 +2155,12 @@ F:	Documentation/devicetree/bindings/arm/realtek.txt
>  
>  ARM/RENESAS ARM64 ARCHITECTURE
>  M:	Simon Horman <horms@verge.net.au>
> +M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  M:	Magnus Damm <magnus.damm@gmail.com>
>  L:	linux-renesas-soc@vger.kernel.org
>  Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
>  S:	Supported
>  F:	arch/arm64/boot/dts/renesas/
>  F:	Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -2269,10 +2271,12 @@ F:	drivers/media/platform/s5p-mfc/
>  
>  ARM/SHMOBILE ARM ARCHITECTURE
>  M:	Simon Horman <horms@verge.net.au>
> +M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  M:	Magnus Damm <magnus.damm@gmail.com>
>  L:	linux-renesas-soc@vger.kernel.org
>  Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
>  S:	Supported
>  F:	arch/arm/boot/dts/emev2*
>  F:	arch/arm/boot/dts/gr-peach*
> -- 
> 2.17.1
> 
