Return-Path: <linux-renesas-soc+bounces-54-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 394107F3836
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 22:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6A1B280DF3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 21:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805A5584C2;
	Tue, 21 Nov 2023 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="M8Qqpnt6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98339D49
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 13:21:46 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7affff20d38so217560639f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 13:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700601705; x=1701206505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1iDPVZpka4nNa9ZhZHYDDoBfymnFnX6WfSx2iwPL40=;
        b=M8Qqpnt6gbULmJHOyiOHBVQcP+3okLsEjg5+TmSTkynRs48yKvF9RfBXd7wbVHTO9o
         pS4eXFSYRzDA5v6D3TSL9frLp+ZopmkgeXurV6aUO0Tv6uslyFpZLfiCNYOxYgjZDx8C
         7B6bcbzfVGaO64yL4Xy6JZruOQM+6inCvKSLUcQ5fR45No+AOZLlrw8EC+TOMpZioENt
         dGqepp/s6uLoReYSS/y/v0PRkUsbquePSCQCSp71E+xyjlo6hRZVOZlB17yQViow1gCA
         Zna75k9L5zIrP/xYxe8gbpMgil0DHrDmbaXD4RK3XJD+kZ/zl1DqjkI13pmfz86QmkIp
         2bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700601705; x=1701206505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1iDPVZpka4nNa9ZhZHYDDoBfymnFnX6WfSx2iwPL40=;
        b=pB8XKtxHdeL4F40XwwM/UclfsDON8ZqRHt8wyG/r2fF/ai5C1ZZnmJ8Tw5d5638AuJ
         6T0sdEPK+8I7QBrkXh72yugnyad0Nfj84ZUnHleW7fzwdsuPNnSrI7e69NrpUeoA6SS1
         gwoFfYM0SYreVJ8BhvQjo9wccGt1Pz9z6D2hiA2Txcu+HrV2ckw+yG4P1SIWfEGsseHH
         a4Ii9ILrgsp1zTh+JyvoR7+jnBC3fn9gkuZbgaSScTeomvmpi0Q00ZjBRqABZCO868Lq
         pt/s0lrKGyF1A0AKvw3TKkfLeimhMTmT9vflBaA0UUxw7715RCIBwr/J24cfTBHppnE5
         8cRA==
X-Gm-Message-State: AOJu0Yxz0BBBmHoJUwl3Yq6QQhw4YHll+9kuDyF6P1VLSgdQzJc8TWjV
	ucAyB5ivqY+yo30huBn5zEwzLw==
X-Google-Smtp-Source: AGHT+IHFnuR563DYa13+P5/j6U4aw6qIjVLFP30n6WKAe9EXfY7bXg7RwkoIvtNqVv18SM2SmM227A==
X-Received: by 2002:a05:6602:8:b0:7b0:733:b8fe with SMTP id b8-20020a056602000800b007b00733b8femr137985ioa.12.1700601705205;
        Tue, 21 Nov 2023 13:21:45 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:9465:402f:4b0a:1116? ([2605:a601:adae:4500:9465:402f:4b0a:1116])
        by smtp.gmail.com with ESMTPSA id o13-20020a6b5a0d000000b007a669ac1ef4sm2945608iob.40.2023.11.21.13.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 13:21:44 -0800 (PST)
Message-ID: <b56e06b5-ff9d-4890-b0e8-ab2c929f9bc1@sifive.com>
Date: Tue, 21 Nov 2023 15:21:43 -0600
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: errata: andes: Probe IOCP during boot stage
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231121202459.36874-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2023-11-21 2:24 PM, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> We should be probing for IOCP during boot stage only. As we were probing
> for IOCP for all the stages this caused the below issue during module-init
> stage,
> 
> [9.019104] Unable to handle kernel paging request at virtual address ffffffff8100d3a0
> [9.027153] Oops [#1]
> [9.029421] Modules linked in: rcar_canfd renesas_usbhs i2c_riic can_dev spi_rspi i2c_core
> [9.037686] CPU: 0 PID: 90 Comm: udevd Not tainted 6.7.0-rc1+ #57
> [9.043756] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> [9.050339] epc : riscv_noncoherent_supported+0x10/0x3e
> [9.055558]  ra : andes_errata_patch_func+0x4a/0x52
> [9.060418] epc : ffffffff8000d8c2 ra : ffffffff8000d95c sp : ffffffc8003abb00
> [9.067607]  gp : ffffffff814e25a0 tp : ffffffd80361e540 t0 : 0000000000000000
> [9.074795]  t1 : 000000000900031e t2 : 0000000000000001 s0 : ffffffc8003abb20
> [9.081984]  s1 : ffffffff015b57c7 a0 : 0000000000000000 a1 : 0000000000000001
> [9.089172]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : ffffffff8100d8be
> [9.096360]  a5 : 0000000000000001 a6 : 0000000000000001 a7 : 000000000900031e
> [9.103548]  s2 : ffffffff015b57d7 s3 : 0000000000000001 s4 : 000000000000031e
> [9.110736]  s5 : 8000000000008a45 s6 : 0000000000000500 s7 : 000000000000003f
> [9.117924]  s8 : ffffffc8003abd48 s9 : ffffffff015b1140 s10: ffffffff8151a1b0
> [9.125113]  s11: ffffffff015b1000 t3 : 0000000000000001 t4 : fefefefefefefeff
> [9.132301]  t5 : ffffffff015b57c7 t6 : ffffffd8b63a6000
> [9.137587] status: 0000000200000120 badaddr: ffffffff8100d3a0 cause: 000000000000000f
> [9.145468] [<ffffffff8000d8c2>] riscv_noncoherent_supported+0x10/0x3e
> [9.151972] [<ffffffff800027e8>] _apply_alternatives+0x84/0x86
> [9.157784] [<ffffffff800029be>] apply_module_alternatives+0x10/0x1a
> [9.164113] [<ffffffff80008fcc>] module_finalize+0x5e/0x7a
> [9.169583] [<ffffffff80085cd6>] load_module+0xfd8/0x179c
> [9.174965] [<ffffffff80086630>] init_module_from_file+0x76/0xaa
> [9.180948] [<ffffffff800867f6>] __riscv_sys_finit_module+0x176/0x2a8
> [9.187365] [<ffffffff80889862>] do_trap_ecall_u+0xbe/0x130
> [9.192922] [<ffffffff808920bc>] ret_from_exception+0x0/0x64
> [9.198573] Code: 0009 b7e9 6797 014d a783 85a7 c799 4785 0717 0100 (0123) aef7
> [9.205994] ---[ end trace 0000000000000000 ]---
> 
> This is because we called riscv_noncoherent_supported() for all the stages
> during IOCP probe. riscv_noncoherent_supported() function sets
> noncoherent_supported variable to true which has an annotation set to
> "__ro_after_init" due to which we were seeing the above splat. Fix this by
> probing IOCP during boot stage only.
> 
> Fixes: e021ae7f5145 ("riscv: errata: Add Andes alternative ports")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/errata/andes/errata.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
> index d2e1abcac967..1c0fef111273 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -60,7 +60,8 @@ void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct al
>  					      unsigned long archid, unsigned long impid,
>  					      unsigned int stage)
>  {
> -	errata_probe_iocp(stage, archid, impid);
> +	if (stage == RISCV_ALTERNATIVES_BOOT)
> +		errata_probe_iocp(stage, archid, impid);
>  
>  	/* we have nothing to patch here ATM so just return back */
>  }

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


