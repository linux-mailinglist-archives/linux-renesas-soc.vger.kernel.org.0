Return-Path: <linux-renesas-soc+bounces-29496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM+CIc8VuGl/YwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:38:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C1A29B878
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B6FD308182F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6EE29DB6C;
	Mon, 16 Mar 2026 14:35:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B129AAFA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671714; cv=none; b=GdQ445KhFFnQd99h0N1DNtY8Gy11H6JpGiddbr5UjSiCqSmpTF6nubegKTyB1u/uPxYgVB+7g6k4MNS+d122OUMPpLNI6RItCfIENsbugWNOQkB9rH00dutYsRR02yYvTpDHYnkFNI55rkGDs5yOCJJdpHBkofHlmQROjr5WkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671714; c=relaxed/simple;
	bh=iy9mAbo+s/T9dKdx46UM1/G3Wgr+pl5kUIJdFdPPHoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kwk1Hvd2PboSHQ+VO2EK8KBY1MfMp9+/RkYnz2AeVqOBRB1CjZuBbktUkpiObLl4Z3wMMszep08IFoaK3hBGxOdP3opbMPWMxQOjdwnnhotXWjbcF3QKuHrSNKkXmhc9W8NhcOCUiGRjLqsRnUoFgG60+501R0RnX1i/eH4Vr4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56afbcd8adbso2067018e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 07:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671712; x=1774276512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEi22uqCpnp8wHRA2MLlWKOoRU5kiNMxo6iy2SBbAHQ=;
        b=P+4AGnCLAfg0aAMX+16vsL2Vje/yJRxLbQSYhPF6bp1T01x0z6xXrGaTROa8IFjUcw
         vkzbU3/7B2roByFLngYxdiFgtr+XhakllADsY0XH3pr177eeSNHGixj3WC3ENTvznC8c
         KNpuHFoGypZSC67nq5s8EsD/WcCwPN78+sEmomV4FHeuSR9DPOgfwHRTAfWgAWG8IwpO
         n/XXq67Gd9q4+YiZKBOqUkZVT+RGn057qNPl0cEDpSfC5JTdiHmHXWhtaKW5/SumSrkM
         05Dx8d4LaUa57SvXptFEixXiwrlFbMtOp+xLpYk93KA4WhOXeHkXMryBXJ6GZlgb8sPm
         OGQA==
X-Forwarded-Encrypted: i=1; AJvYcCXYcEnEbwHfp5lLVsJgAXHB89COcfWoPB+qoZsgCc541vP7VAAjpSg3ZAdjccW+i26bJTESclB2/JdWt4gEJ2g8xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAw4TmowFYfATMDzyRgkRlUM1UpwZT8J5KZDL9k4XNBy/RYJd
	zHK6xp97VwvZSudm9TBkOXz95qtMIHjmQvl+gw9RC/9PjHD6Pn1NboUeonu/z9EK
X-Gm-Gg: ATEYQzwoRTeo3mVnhuRwJGaRtZbKbbxCddU4Sl9RuL3le4ftb6V0qqmHXfKn6ygVu9D
	shzN4aomqu1DicUJ6X/2qOMEXVsRMtWY9fIkssEal5A2+aUfjJbpCl703/UqjGxNQpMI5xJ/lUV
	qjE3iiMJS4XRMa1wdkYUW8fEiAUop04N/3+RiWo8E0icy1klpwoZ2h5TbnngakyKUK7qyXP2qDx
	uPUqVtJJ5VczxPaCSzK2y7So1omK7s8qQrKHwpGE3cwav3ozA4keS2LTBjKZIjjWKJ6El4gnR63
	IMB0OrITUw+1znBRcOrEmTr4INBK8YF0PkBHUSX9arvakHHTvEDrxsi92ZtrdQob2EVuF0zZPVZ
	MBwg5PvFZvsoHOUWZuOppAbJWdWBIkUA89OUE65k+JuUMO/K+bDkiDgqFDBUUJaCAdkgucG8ili
	Y67yL37wK7o/LULk805zHpI4yz8+TewiPtryYmbM0PDTOq+OR6k1D0wnkX36Zk
X-Received: by 2002:a05:6122:46a5:b0:566:eb31:4715 with SMTP id 71dfb90a1353d-56b6284a2e6mr5163251e0c.8.1773671711808;
        Mon, 16 Mar 2026 07:35:11 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b768d76e1sm3042574e0c.4.2026.03.16.07.35.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:35:10 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-950b801b75fso497953241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 07:35:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS7ibme5CKK5UsfjQtyLk0rY2nEpsVNNdNw1z0HUvbxGwyybycNiA0nkJNfiUPJrfp4KrnKg3XoQI8YO3ZZJna1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3711:b0:5ff:be25:8934 with SMTP id
 ada2fe7eead31-6020e176ecemr4558310137.8.1773671710334; Mon, 16 Mar 2026
 07:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <abgQpsArW3VrCAns@shikoro> <c3af22f6-d937-4539-8eb7-d7f0b0892ca2@kernel.org>
In-Reply-To: <c3af22f6-d937-4539-8eb7-d7f0b0892ca2@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 15:34:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWdyK6YKSrExmvzG9sPdr-xihJROAeZGLh=xAB6sObVsw@mail.gmail.com>
X-Gm-Features: AaiRm53dfSLRgvt3HKUnwt4jeNK1RNa3l_ZjqMoT8LvOA5hXcJ4fFaeKP7Uw9XE
Message-ID: <CAMuHMdWdyK6YKSrExmvzG9sPdr-xihJROAeZGLh=xAB6sObVsw@mail.gmail.com>
Subject: Re: [PATCH 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,gmail.com,kernel.org,glider.be,bp.renesas.com,vger.kernel.org,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-29496-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: E4C1A29B878
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Mon, 16 Mar 2026 at 15:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 16/03/2026 15:16, Wolfram Sang wrote:
> >> Add a new compatible string "renesas,r9a09g077-xspi" for RZ/T2H while
> >> reusing the existing xspi_info_r9a09g047 OF data. This allows the driver
> >> to bind correctly on RZ/T2H while the register differences can be handled
> >> in future updates as the affected configuration registers are not currently
> >> accessed by the driver.
> >
> > This sounds fragile to me. Can you add a comment somewhere in the driver
> > or headers so people wanting to use these registers will find out that
> > the SoCs are not compatible anymore?
>
> IMO, this patch is not needed. If you need to handle differences in
> registers, then you add dedicated OF data.
>
> The change here (with the bindings) is actually confusing, because
> effectively it says two contradictory statements:
> 1. Driver patch: devices are different but they are compatible in
> meaning of DT,
> 2. Bindings: devices are not compatible
>
> So you need to decide which above, but not both.
>
> Eventually provide extensive arguments in terms of how DT understands
> compatibility.

I disagree.  Using the same of_data can does not mean the devices are
100% compatible.  It can also mean that the devices are different, but
  a) The differences are not handled yet, because the extra features of
     one variant (or both variants)  are not yet supported by the driver,
  b) The differences are not handled explicitly, but implicitly,
     or elsewhere.
     E.g. the different number of resets is handled implicitly through
     devm_reset_control_array_get_exclusive().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

