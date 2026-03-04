Return-Path: <linux-renesas-soc+bounces-28754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /aDUIMASqGnUngAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:08:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F301FEB0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 098B93044081
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B0339D6FB;
	Wed,  4 Mar 2026 11:06:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D753371D02
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622387; cv=none; b=F+EQuyVDHH5Zw/V0Ro3KuR1AsPADpK+ral4mViXtYQNYOrRNJFtArkqJ/yGkH0mPQ1onZHAhQ5IB5mDUhvS8Tb1Y80lLFdHqGMtQZp/iLZ3u+VFnhyMBy1b6NFLdTO7SJ9/3LNw0qiucqTDOFOAn6EDKCWMhobdl+QDAq1A+mtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622387; c=relaxed/simple;
	bh=h4xGx8Lo/3rAAkJbNp4e33YxvrMf+pmcL7aFTI610mE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2n//+r6NM0g296egAu30pfnxZaoJpdb8l5vx54WkVr/cAeGExPpEM2hmzJ490sDqsyllosVXW7fBDxbqaakgAJedphiDKz2xncHHbA7z5SBUSiwbduqyd8Qe9NXvo4oH8FHxFZbxaEFzx3vJ4fAVZeU7OuvUkGe6bqzplKR3LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5688b9e4e80so1764066e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622385; x=1773227185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc1lWKqwyxd1K+z/jMu8xneXJ1RZxhNWU8LvY2R0KKY=;
        b=H0v+HQdKywhLhcQAOyVxmBrMNpuK9nPFKjIKO3aGY21wr/ubWyEzouWyG62LSkgW47
         YZLwR4oSSFnm24IZMt7QyzBr4RpWL+LXnyFBu/Gj7cSZvW+9s4ql1Cheu4oobEYKOWTE
         Cq8vbFU6PxAvhDcjVEAjb890mcUxOy8h5vBRaE7ZcqoT4fOWI1UVYSwVGkSOljWMMIuK
         vDyiZy62KXTyR6lEoPNYmV9wKU61CVAnab4mVzg8wECrUuQV2N6hoay7XKBeBcBDQzNL
         u5RyeTbYXGj+aGuzDSjvITLtqw1dKvN78eD9Pq2kBusfKZvPdVkikBFF/FPYNIfctSkJ
         Hntw==
X-Forwarded-Encrypted: i=1; AJvYcCXDiyivEdlVOH1z1PAuMU7LXpCWDGHbUoc1Xk8yGt6DPBpXnj98ocQX/tE9xhR1wSnJpzB7r7dgxTdZvxrTRmKc1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhjUZqeW0Xh3QDen+3HVepls3eIvsREwMvtMRCHPRu+PpeD0Mu
	mDKAd5pryP6Tat+1SOcIyaIWPAJAiDdHgUh9eIYjIPqJS2dDMe5TpUd0wT7DMrEk
X-Gm-Gg: ATEYQzzROaMw7OkjRJGPTa6hyOtBgCknxZ9jN3tWAaI5QRgzwaG7HJxWamEm3KpF7Bc
	OtehIJ0ZENBfr4VZGabNnlKQpMrjzu7wwtJ2L4ZHvMI/Zyc8UWZxEdtxAaxR1gCgJ0YkaUJtzXN
	L10uF5MXVnlEBPPD6IHrucSne2WQa4vCa5illqe/iMJCDRUct0BsqquOqtC1RSpp1RhBgG31Epd
	zXeHBhm8X/DHvaZwkmiv/KhpquRfi89vHkUAifKUKT6chlwu6W+frOS8PYd5dr1q7kLuo6mUPDn
	vMctpZOWuMOtniYqvFvijEWM9UrX1bb1vxBRFN6oVKHEiII4Adc0JWBclTiCJm3IXfp8BT8/K4J
	VDAlbekO77DfR6wVwSqcUHxmJsrdmXj1OD1QupB1EHgCFenA2VkNabBA+Sjkm6Z7Getc/uSjJdd
	W687JqZrGlAu+rYZxWGWbYBCcpYlzGs0m2aFUULS7wIhq9WRBLK+4JfdHflHAs
X-Received: by 2002:a05:6122:4d19:b0:55c:be5e:e9e9 with SMTP id 71dfb90a1353d-56ae7eae6e2mr638201e0c.1.1772622385076;
        Wed, 04 Mar 2026 03:06:25 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb97absm22318528e0c.6.2026.03.04.03.06.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:06:24 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94ac3958788so3697713241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:06:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8BEAfWn3Z/6Hw3R2AGDY9ppqHtg5/oTlDEWxNft+zi+F/5HFxnv/s10wfhXT8TV4Q37EsqyF6YXzZlie5BoUymA==@vger.kernel.org
X-Received: by 2002:a05:6102:c04:b0:5f5:3739:100d with SMTP id
 ada2fe7eead31-5ff8f555c1fmr2447437137.0.1772622384397; Wed, 04 Mar 2026
 03:06:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1cfa86b72b2a5aa2ade92f247dd318c9cb6ef2a1.1771267504.git.geert+renesas@glider.be>
 <CAPDyKFotV3bUEQic6X3PEC8m4fcXtc0JF0u7HTj9nRF1koowgA@mail.gmail.com>
In-Reply-To: <CAPDyKFotV3bUEQic6X3PEC8m4fcXtc0JF0u7HTj9nRF1koowgA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 12:06:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwLqWxp1pYj3fHf6OVtxrScg=wP=bdwLbjo7vpgmP4Jw@mail.gmail.com>
X-Gm-Features: AaiRm51l8HwBRY_tDhyX1MH5hQpu6lRSnZBK8l-db6--eDbumd1dAL9LGKVifxA
Message-ID: <CAMuHMdUwLqWxp1pYj3fHf6OVtxrScg=wP=bdwLbjo7vpgmP4Jw@mail.gmail.com>
Subject: Re: [PATCH/RFC] pmdomain: core: Support pd_ignore_unused with sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F1F301FEB0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28754-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,linaro.org:email]
X-Rspamd-Action: no action

Hi Ulf,

On Wed, 4 Mar 2026 at 11:56, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Mon, 16 Feb 2026 at 19:47, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Since the introduction of the sync_state mechanism, the
> > "pd_ignore_unused" kernel command line option doesn't really work
> > anymore.  While genpd_power_off_unused() still checks for that flag
> > before powering down unused domains, the new sync_state callbacks lack
> > such checks, thus powering down unused domains regardless.
> >
> > Fix this by adding checks to the sync_state helpers and callbacks.
> > Factor out the printing of the warning message, to make sure it is
> > printed only once.
> >
> > Fixes: 002ebddd695a5399 ("pmdomain: core: Restore behaviour for disabling unused PM domains")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > RFC as I have no need for this in upstream.
>
> I am trying to understand the use case and whether we should consider
> to land this upstream.
>
> Would you mind elaborating on how this is useful for you?

It is (currently) not useful for me, but it may be useful for others.
During work on a new SoC, someone had hardcoded "pd_ignore_unused"
in the kernel command line.  After adding support for PM Domains on
that SoC, I noticed PM Domains were still powered down.

The issue is that pd_ignore_unused no longer does what it claims to do:

        pd_ignore_unused
                        [PM]
                        Keep all power-domains already enabled by bootloader on,
                        even if no driver has claimed them. This is useful
                        for debug and development, but should not be
                        needed on a platform with proper driver support.

So IMO that should either be fixed, or the option should be removed.
Do you agree?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

