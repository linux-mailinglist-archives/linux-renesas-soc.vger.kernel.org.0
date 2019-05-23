Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4AF27ABE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 12:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbfEWKgH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 06:36:07 -0400
Received: from foss.arm.com ([217.140.101.70]:43228 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730749AbfEWKgH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 06:36:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E5B3341;
        Thu, 23 May 2019 03:36:06 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 272DB3F718;
        Thu, 23 May 2019 03:36:05 -0700 (PDT)
Date:   Thu, 23 May 2019 11:36:02 +0100
From:   Will Deacon <will.deacon@arm.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     catalin.marinas@arm.com, kuninori.morimoto.gx@renesas.com,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, daniel@iogearbox.net,
        jean-philippe.brucker@arm.com
Subject: Re: [PATCH/RFC] arm64: fix build warning from
 __AARCH64_INSN_FUNCS(ldadd, ...)
Message-ID: <20190523103602.GJ26646@fuggles.cambridge.arm.com>
References: <1558599120-29394-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558599120-29394-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

[+Daniel and Jean-Philippe]

On Thu, May 23, 2019 at 05:12:00PM +0900, Yoshihiro Shimoda wrote:
> The following build warning happens on gcc 8.1.0.
> 
>  linux/arch/arm64/include/asm/insn.h: In function 'aarch64_insn_is_ldadd':
>  linux/arch/arm64/include/asm/insn.h:280:257: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
>  __AARCH64_INSN_FUNCS(ldadd, 0x3F20FC00, 0xB8200000)
> 
> Since the second argument is mask value and compare with the third
> argument value, the bit 31 is always masked and then this macro is
> always false. So, this patch fixes the issue.
> 
> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Fixes: 34b8ab091f9ef57a ("bpf, arm64: use more scalable stadd over ldxr / stxr loop in xadd")
> Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  I'm not sure the second argument "0xBF20FC00" is OK or not (we can set
>  to 0xFF20FC00 instead). So, I marked RFC on this patch.
> 
>  arch/arm64/include/asm/insn.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index ec894de..c9e3cdc 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -277,7 +277,7 @@ __AARCH64_INSN_FUNCS(adrp,	0x9F000000, 0x90000000)
>  __AARCH64_INSN_FUNCS(prfm,	0x3FC00000, 0x39800000)
>  __AARCH64_INSN_FUNCS(prfm_lit,	0xFF000000, 0xD8000000)
>  __AARCH64_INSN_FUNCS(str_reg,	0x3FE0EC00, 0x38206800)
> -__AARCH64_INSN_FUNCS(ldadd,	0x3F20FC00, 0xB8200000)
> +__AARCH64_INSN_FUNCS(ldadd,	0xBF20FC00, 0xB8200000)

Looking at the ISA encoding, I think that top digit should indeed be 'B',
but I haven't checked the rest of the instruction.

However, I'm fairly sure we tested this so now I'm a bit worried that I'm
missing something :/

Will
