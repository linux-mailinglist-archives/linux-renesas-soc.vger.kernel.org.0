Return-Path: <linux-renesas-soc+bounces-28763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFROGncdqGnyoAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:54:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E361FF5CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 12:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 424EF300EFBA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 11:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E627C3A8727;
	Wed,  4 Mar 2026 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4MudI2c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4773537CE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625130; cv=pass; b=hCNDdMOAYqVAo/NqcxDHYdo1ia9RDLkTxzsTuO1iJdpMNgSqASY4b5HxsjjzhcbnjwXLYYPBXvv7gqC1KULKfXggkTV2jwVOaxiA4lcCfs6kZp1rEWreod94IBS6f4VzQroK5Ku15kA9uLHxC36p3RiZOX8yeRlSUPBgNznnaXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625130; c=relaxed/simple;
	bh=89nhl3kHx/o/l2BP+mQCx42eqbHpoo6C1RBMLf+6uyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtwDaISZSOlFji0no1zQYNah3qTZjlJY7gWyokoQF23opei0m3dAYzH/AziI686qIsSzQzsyRmw4d4w2mA4BDFXd/iSeHK/Yv3zUUVuYj4LjQ1zQ/ErM94rpN8fOVmXyPFjxrAZjwv2bxzx2vNx7aZ+lTjGVn/z+u03ll8fxESw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4MudI2c; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a23cf08e0so25445541fa.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 03:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772625127; cv=none;
        d=google.com; s=arc-20240605;
        b=Grog6aqy2eWtkUlP103JTxsaZEP98+UjDbBDKQRWLyWP4H458koKRKPFlFB4ovaGce
         lOA3St8cud6IUWGFFMpEO4y56/EyyJ9lV9xN3aL97Z6Gypu00WHCy68qWGwn26iWMTtA
         LVUHHQ4Kvu9CfRp6D2KaQL3gMqwZSkxB8Ov1nocSK9aIXhw8gpHwKoHtM8MAw27iIRdN
         yuSRHvi6D8iiD2KNGfBTuj9MJan5MOM+DGZiq49gkBHfG1kO3C5bS0tbvrVlGLKHIE80
         NI1BGWeogN0S/pFuHKmAGZXtR1EZJMaf4LsF/08A/ete7C/Wj149yaGDZ3MuqMUgv9W5
         tosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bokPD3BMNns3x1kZqoCBsT9+nMQiuj/clSnCRy4TfZI=;
        fh=RFTI3bKngsZi5n4+7N50v3HQYi81zaz4fA9B0+Z/Gyw=;
        b=QjnZh6Tg5Tibma/pottI4QyDziv7wcH1AC6wvRW80AhvnsfMRAqMmBh32oLrFqoyNE
         DYRsstkXIVtdU4WL5BOXqIRponJQL3gSVrB4btqcRxs1hYXL4xhcgsTgejPjsj1jD4/5
         V6YF6EelzXvdjatkDxkAkr8N918T46f2MojaEw+UTQq1wKkjrLAiRF/MdgBJszWE7Pd4
         sU2DzN/SpvxGvpJfmaYoqANiJhD6d/O9inrcF8kDOJ0RQKihklc+9qbpN4JHsa72txDp
         kmY08Fg70L5X1JPSUnvN4zv6KAPVjB8v2KRCz6sfbmSFuXLJRJXD4EXPdhZrba3FQvBe
         arBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772625127; x=1773229927; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bokPD3BMNns3x1kZqoCBsT9+nMQiuj/clSnCRy4TfZI=;
        b=k4MudI2cBP+H60L8Sf3oOxZrlsN+eTAr/MFpzaFQ14/41ZKSxP6sYUJ58LEkQPJNgo
         X8zw9jDN+ldYOD0EerKlMU6WWLQv/e/2vRyqL4PdP/UkXY5aGFwuaCWvcr6DChtNTFlW
         5jGpivfL5IxE4vWC0ZqOuNmpKA0zOzavvgNOU21lBx1S4UtALdjgxpWbokLixjHfTfIa
         H5E6eGxvuxhUi9mDv3Pjn5sdtNA1bZ+WdndPazv7IhiAgNB76EKADt4A/Qz1pqFjp19V
         6vZwYpTjc02XPmo37hcqN/UhnyLsaEdMLELgnpEXtl2iHBoibPORhOl+HRHkVGMIz233
         8Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772625127; x=1773229927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bokPD3BMNns3x1kZqoCBsT9+nMQiuj/clSnCRy4TfZI=;
        b=NjN/f4WYi5/fepp6YFd1DRiJXHkSR7I8UWrvpk8UdfvlO8NmzXuzBwjDEA1ENoOxFH
         zVudA39O7cnFGWl1w1acNs7TDe0+ZkKQ3X1KQVyv1p4UfazGW4eNX4v4VwwBsEocTXBO
         j99AAxO3CejlnhkxRQyzCabro5Ykp83ZyXvCPbtqKLAwQysHarbNF1d39Zd4mYGrqXbG
         cIVgd+ys51T3dbir3hzeEvAeceYPKKbguerib8sroQKEkMuBY92C4q5+YpvS2KQN0WRo
         Zxv9UgLZEEp57Oa9Us6oV1Mv7sTcSvBYilVC6voQLlebofKPajQEfg6+Uh3MV7XSH8GG
         COtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7tcDcQxe8PvrPJGCoLmA0hiMq1pn9xon+NBh0EPSjgKXqqDyIvmD6oxS3rBOZzKngGw7iBNi8JbJSdhlvT8MXKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxRjA3s/jeLVEbHcVE7JdfYfOTVwU72eJvy21xAwr3Ju/pbVe
	T7W0I5jf7ZW7xOZxk23AJ+kDMfalglQvKO11R91Mk0OZqs5ywBCoIUqzzwxQXzKWinqdGESk7Ed
	tu0MMRZipSvAa1vhJz5DuYvMX9q5zZOvUgfmtj69dPi9U3I3bPUkqRPyIVg==
X-Gm-Gg: ATEYQzzpf8JwgN2FNjy+KWd9ufg6mT0bnxrsla1gnJh+wE3CZsWyNlDI1cgOO50os1f
	1tDUKPcl2LVzB4/feW+GT6ryyuxhE05FKNVq6LLhHcECIZJlfLUk2z16/RodVcPRIy1bBPbiuxL
	/cx3NWGDFMMMr62rCVrk3Yaiuwlc5s6IhhdSVyQAmP7xztSpzmQXgUfzqZgsFUYg7HyoSoXB+/4
	in7n/xEQR1OpPyifUCfpMove1W0yPC/MPFzkudcoHMmuovoxFB4uxu8pp6tBcX6wLTxA9jwRWn4
	ybKpGOwo0HCPWdZklAs=
X-Received: by 2002:a05:651c:110c:b0:386:ee99:6cb3 with SMTP id
 38308e7fff4ca-38a2c574c04mr13141631fa.9.1772625127349; Wed, 04 Mar 2026
 03:52:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1cfa86b72b2a5aa2ade92f247dd318c9cb6ef2a1.1771267504.git.geert+renesas@glider.be>
 <CAPDyKFotV3bUEQic6X3PEC8m4fcXtc0JF0u7HTj9nRF1koowgA@mail.gmail.com> <CAMuHMdUwLqWxp1pYj3fHf6OVtxrScg=wP=bdwLbjo7vpgmP4Jw@mail.gmail.com>
In-Reply-To: <CAMuHMdUwLqWxp1pYj3fHf6OVtxrScg=wP=bdwLbjo7vpgmP4Jw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Mar 2026 12:51:31 +0100
X-Gm-Features: AaiRm51AEYQZCHawi9S-OmAkgl7UCrfFFz9JqnTGEGT0Np2553dLVerq52x8hOk
Message-ID: <CAPDyKFq2it5TAEBBKBh+q+UiRsGYaORar0Q_42LCuxyKRLYj0A@mail.gmail.com>
Subject: Re: [PATCH/RFC] pmdomain: core: Support pd_ignore_unused with sync_state
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C4E361FF5CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28763-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.208.173:received,100.90.174.1:received];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 12:06, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Wed, 4 Mar 2026 at 11:56, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Mon, 16 Feb 2026 at 19:47, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Since the introduction of the sync_state mechanism, the
> > > "pd_ignore_unused" kernel command line option doesn't really work
> > > anymore.  While genpd_power_off_unused() still checks for that flag
> > > before powering down unused domains, the new sync_state callbacks lack
> > > such checks, thus powering down unused domains regardless.
> > >
> > > Fix this by adding checks to the sync_state helpers and callbacks.
> > > Factor out the printing of the warning message, to make sure it is
> > > printed only once.
> > >
> > > Fixes: 002ebddd695a5399 ("pmdomain: core: Restore behaviour for disabling unused PM domains")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > RFC as I have no need for this in upstream.
> >
> > I am trying to understand the use case and whether we should consider
> > to land this upstream.
> >
> > Would you mind elaborating on how this is useful for you?
>
> It is (currently) not useful for me, but it may be useful for others.
> During work on a new SoC, someone had hardcoded "pd_ignore_unused"
> in the kernel command line.  After adding support for PM Domains on
> that SoC, I noticed PM Domains were still powered down.
>
> The issue is that pd_ignore_unused no longer does what it claims to do:
>
>         pd_ignore_unused
>                         [PM]
>                         Keep all power-domains already enabled by bootloader on,
>                         even if no driver has claimed them. This is useful
>                         for debug and development, but should not be
>                         needed on a platform with proper driver support.
>

Well, this is exactly what the sync_state mechanism intends to
address, but in a more correct way compared to pd_ignore_unused.

If a consumer device that belongs to a power domain, lacks a driver
(or it never probes) then that power domain will not be powered-off by
genpd (if it was on a boot). For the pd_ignore_unused case, we may end
up powering off the genpd anyway, becuase child-domains being
powered-off, for example.

For incomplete drivers, the assumption is that the device attaches to
its genpd but runtime PM remains disabled for the device. In these
cases, genpd will not power-off the corresponding power domain.

> So IMO that should either be fixed, or the option should be removed.
> Do you agree?

Right, I think it's time to consider removing it, unless people still
find it useful ofcourse.

Do you want to send a patch that we can test/review or you prefer me
to handle it?

Kind regards
Uffe

