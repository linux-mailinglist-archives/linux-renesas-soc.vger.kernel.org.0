Return-Path: <linux-renesas-soc+bounces-28385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM10ChwqnGkvAQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 11:21:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6633174C39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 11:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54327300AB0B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0406534F48B;
	Mon, 23 Feb 2026 10:20:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9E31514F8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842053; cv=none; b=BLWYsSOaT8Dx4fpwObc6lERFAHt9ZR0GSpjO0/FfQtj6FnFaMhxCDyRejhF9bupGyfllpQHqbtnZgFcfxdKJelUnGzGDmyPVUKssyUx/nC06HNZ0DYa122Eo46XA658bADjuoi+hmGe3/E5VPCA1MbmIJOZcWDLvBk0mrbzUkIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842053; c=relaxed/simple;
	bh=qmklrboQIpSfdlDZ2hHPRPuP8NQIz98sLqpsBfIp1xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0yfrQdcr3/O9qEIDVu9GVz9bah6JAmklHk80v1D4gDcvEV305P3MyHOxIrt3laLzlxG5ZR6ByRa9PFcB6UAmNRAhmtVWYwlPdaeiQFx8NJNwFnvyYnLn76MfL1MjUPiaGv9zZIk54EJzCvcz7vohE3Nrw+knv7YA9NB7ERsfRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a8fba3f769so18243525ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 02:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771842052; x=1772446852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYufON41haCPAAlB17VyKfqSryTL2wR1KeTBsoMTWuQ=;
        b=QP496Fk6ZQ0N/+OmXbjdWJZfvIjdXsF29POWeioPkAOgb1TUX5zOnVtxOTqx6dGqPL
         w+2ZDUS/A3tOBmNGarV1xQ/qBUJQjizhPP4cZaTGJhZf/GnSJeIzJngiinh9O/vTqKMN
         8egyn5HNqBPvnwRIAEm8E6EyrT7Z1NrR3zciGcdXN8NgHSNUrO7/iD0X3Dx43U1YfnZM
         qlnFhJDa8S/msmiNulfSR+TG+ZnkS+wjvecJHCxXCfwHzXMF01cnTdoawiPvanz2p9Nh
         5sU0i8NJD8UqPM6jEoB1x4kXSihuWhpyvc/vlLKw3aklFYIkHLMlDy/tHknSwSuujByI
         GiSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnKVjTw9R5cYg7TgHYPUx/BpT9sqeWvackUou3mxrcCiWyTfnxSYd1c0+2qUCWD8Zflo317Fr5/3DUme4zu5kr+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwgV/YPPJ7a9RtAgbCV7sGuYxEAxVMkOzlhS7dIbEx2WrWkfhI
	a/sPHLNIQ/wj+yND9hCyzVngDSeT5DXladU8d78FOWj284IPeSorK2iEObCUeK/a
X-Gm-Gg: ATEYQzziJcjbUlZykb3bmK8a8oAhTYgul+PSd5T3pQFRgZPKv43gweP9NcHCOETWZYh
	w652TSQ6bH8PkFm7Po0cUlkJinohyiL657cwWce7XRgpeiveO9eaZDrDSuhaoT5xtVv0WheTzMe
	ec9IbZpjF/DSpEdp1nS/a+ZkFA3BxU5fyOpooYQae35qMJuHfoDJJLHlZCsEOeZSgAfjTCcIADn
	wvW67MrHmWCD4KYAqos3iIjTtvZ96kFqKUlAl/Tb1b2ozoAeKE2d49A1Mrp1V/YbLzDtuOkPROo
	lyDh/RpPWR22GHRAPAv+B7qUePtB2HUaWEz8LCqTOSwoYrTblzpKymJ5Kwe6p6zgpf6NvLc4GA6
	SbmSUYMrQIQL1No3FT9CEwdeoDxWdyelNBfDVsKy8UBbHPxr3R3DGnXwZIfMQ9Z159jw6vZxPpE
	NTJ2UwLydXgH2RNlY4p9NfcH+u9cA5RctbTWJSi4urT/I8jShkSUkgC7BJjQsVZGTgzYikTA==
X-Received: by 2002:a17:903:46c5:b0:2aa:f9d7:68aa with SMTP id d9443c01a7336-2ad74467e33mr81823015ad.21.1771842051862;
        Mon, 23 Feb 2026 02:20:51 -0800 (PST)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5e55dsm71841125ad.30.2026.02.23.02.20.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 02:20:51 -0800 (PST)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-126ea4e9694so5356019c88.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 02:20:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/ocwwPgTZQVG/2jHY08VDERM1wtERQNjPm6nuZh6TE/ZQncg6GLdLQzCetjfdqwtdPfAj4YBQESP3tENvWukyCQ==@vger.kernel.org
X-Received: by 2002:a05:6102:38d3:b0:5fd:8175:2eb7 with SMTP id
 ada2fe7eead31-5feb30db471mr4509289137.34.1771841684922; Mon, 23 Feb 2026
 02:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217212707.2450423-11-cassel@kernel.org> <20260217212707.2450423-12-cassel@kernel.org>
 <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810> <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
In-Reply-To: <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 11:14:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
X-Gm-Features: AaiRm52HvurLndDwor1bgpbfCcI9wH1Ckd1tYC4oQp0RsW6za3e41CkVlZ_fe6s
Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den <den@valinux.co.jp>, 
	Damien Le Moal <dlemoal@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-28385-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,mail.gmail.com:mid,linux-m68k.org:email,nxp.com:email]
X-Rspamd-Queue-Id: D6633174C39
X-Rspamd-Action: no action

Hi Manikanta,

On Mon, 23 Feb 2026 at 04:57, Manikanta Maddireddy
<mmaddireddy@nvidia.com> wrote:
> On 18/02/26 3:27 am, Frank Li wrote:
>
> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
>
> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
> BAR_64BIT_UPPER from BAR_RESERVED.
>
> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>
> This makes the BAR description more clear, and the reader does no longer
> need to check the BAR type for the preceding BAR to know how to interpret
> the BAR type.
>
> No functional changes.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>

[...]

Please do not send HTML emails to the list, as they are rejected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

