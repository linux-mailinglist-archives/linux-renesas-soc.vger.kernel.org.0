Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0118327F56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 16:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730690AbfEWOQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 10:16:46 -0400
Received: from foss.arm.com ([217.140.101.70]:47310 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730323AbfEWOQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 10:16:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A312880D;
        Thu, 23 May 2019 07:16:45 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BBE53F690;
        Thu, 23 May 2019 07:16:44 -0700 (PDT)
Date:   Thu, 23 May 2019 15:16:39 +0100
From:   Will Deacon <will.deacon@arm.com>
To:     Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, catalin.marinas@arm.com,
        linux-arm-kernel@lists.infradead.org,
        kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH/RFC] arm64: fix build warning from
 __AARCH64_INSN_FUNCS(ldadd, ...)
Message-ID: <20190523141639.GA31896@fuggles.cambridge.arm.com>
References: <1558599120-29394-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190523103602.GJ26646@fuggles.cambridge.arm.com>
 <4b35cc15-9e35-eb67-3cfc-3a8eff8c462e@iogearbox.net>
 <1daf0c3e-745b-386b-4a8d-bfb18f987239@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1daf0c3e-745b-386b-4a8d-bfb18f987239@arm.com>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 23, 2019 at 02:54:54PM +0100, Jean-Philippe Brucker wrote:
> On 23/05/2019 14:02, Daniel Borkmann wrote:
> > On 05/23/2019 12:36 PM, Will Deacon wrote:
> >> [+Daniel and Jean-Philippe]
> >>
> >> On Thu, May 23, 2019 at 05:12:00PM +0900, Yoshihiro Shimoda wrote:
> >>> The following build warning happens on gcc 8.1.0.
> >>>
> >>>  linux/arch/arm64/include/asm/insn.h: In function 'aarch64_insn_is_ldadd':
> >>>  linux/arch/arm64/include/asm/insn.h:280:257: warning: bitwise comparison always evaluates to false [-Wtautological-compare]
> >>>  __AARCH64_INSN_FUNCS(ldadd, 0x3F20FC00, 0xB8200000)
> >>>
> >>> Since the second argument is mask value and compare with the third
> >>> argument value, the bit 31 is always masked and then this macro is
> >>> always false. So, this patch fixes the issue.
> >>>
> >>> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>> Fixes: 34b8ab091f9ef57a ("bpf, arm64: use more scalable stadd over ldxr / stxr loop in xadd")
> >>> Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >>> ---
> >>>  I'm not sure the second argument "0xBF20FC00" is OK or not (we can set
> >>>  to 0xFF20FC00 instead). So, I marked RFC on this patch.
> >>>
> >>>  arch/arm64/include/asm/insn.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> >>> index ec894de..c9e3cdc 100644
> >>> --- a/arch/arm64/include/asm/insn.h
> >>> +++ b/arch/arm64/include/asm/insn.h
> >>> @@ -277,7 +277,7 @@ __AARCH64_INSN_FUNCS(adrp,	0x9F000000, 0x90000000)
> >>>  __AARCH64_INSN_FUNCS(prfm,	0x3FC00000, 0x39800000)
> >>>  __AARCH64_INSN_FUNCS(prfm_lit,	0xFF000000, 0xD8000000)
> >>>  __AARCH64_INSN_FUNCS(str_reg,	0x3FE0EC00, 0x38206800)
> >>> -__AARCH64_INSN_FUNCS(ldadd,	0x3F20FC00, 0xB8200000)
> >>> +__AARCH64_INSN_FUNCS(ldadd,	0xBF20FC00, 0xB8200000)
> >>
> >> Looking at the ISA encoding, I think that top digit should indeed be 'B',
> >> but I haven't checked the rest of the instruction.
> >>
> >> However, I'm fairly sure we tested this so now I'm a bit worried that I'm
> >> missing something :/
> > 
> > Hmm, good catch, the mask aka aarch64_insn_is_ldadd() is not used anywhere
> > in the tree, just the aarch64_insn_get_ldadd_value(). Latter was runtime
> > tested via BPF JIT as well as through disassembler that it emits ldadd. I
> > initially had a different mask value than Jean-Philippe, but that was probably
> > due to confusion on my side. In any case, value should be correct though.
> 
> I suggested that mask and forgot to change val, sorry about that. My
> intent was to stay consistent with ldr_reg and str_reg, which mask out
> the two size bits [31:30]. The proposed fix works but won't take into
> account ldaddb and ldaddh, so maybe we could change val to 0x38200000
> instead?
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index ec894de0ed4e..f71b84d9f294 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -279,3 +279,3 @@ __AARCH64_INSN_FUNCS(prfm_lit,      0xFF000000,
> 0xD8000000)
>  __AARCH64_INSN_FUNCS(str_reg,  0x3FE0EC00, 0x38206800)
> -__AARCH64_INSN_FUNCS(ldadd,    0x3F20FC00, 0xB8200000)
> +__AARCH64_INSN_FUNCS(ldadd,    0x3F20FC00, 0x38200000)

Yes, this is better. I didn't realise we wanted to catch the sub-word
instructions as well, but that's what we do for other memory access
instructions so we should be consistent.

If you post this as a proper patch, I can queue it as a fix in the arm64
tree.

Thanks both!

Will
