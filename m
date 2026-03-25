Return-Path: <linux-renesas-soc+bounces-30264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJa/KoMSxGkXwAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:51:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC3D329638
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04ACD3112E56
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 16:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DADB3FD13E;
	Wed, 25 Mar 2026 16:36:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A5F3FCB1F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456561; cv=none; b=N9eGTLwVJ0XlyLxL0i8mQw61E6BSoRMmkdTVTn10P1ShCRpGUXziJkhF4FwvUatJuFVoFahfvu4C8c+BCWHvDZik8T5zbJrl4yhsGTq1rAQOsJVl2qRrbjXKpPsG7DkAeTe5aOFw0dYNaituNDYuF++fxMDqTdUqZg1Xe31RlBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456561; c=relaxed/simple;
	bh=vX6p1CDvWad+GoKbzvthJkwyI07/wTijn9ZWHgYK/o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLNeyl/TtD5dd5qM+RnjtHdOcuFGxgzHlObaZNuP2rgcAvm8bmEr5MbJZ0tuZ6DkQ7Wjov2yXY9Y/DGGZihT90ZxgPMNG528XJch9A9zPFVXNH8qVEH82f7EGHCkmgoitk8yIaKUjQ1smn72HeRgmRLicTdSSOhiV23q4/ajCws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56cf45deb45so77309e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456559; x=1775061359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDjwaAywwU03wv0+eLKkG3IGOSH5Z69cyrkxX7M6ckw=;
        b=osLKpEN+O43OP8MiEr5QGDqVwTBCD7epJiPOlv50G1yfcsFzXbrvaO2PeTcXIdxtU8
         laWfvIljHCorMJF8WxAcVeuz2uiha8X9yfxOUSM6/9aCeYNP/3DDi4GRzrzsBM/tp9fa
         RUVlUkGMrH6IO73JfquDaGYq+cOow6XKvyCLgMDIF3JnjdO9Bf8X3cDwQk4gG21gspGg
         QqI2e421otQALqqSxrRLhxV9r7nqSvfvTyL5R8xo59C3BXdl8w4CHPvZ6HNeG59llFs5
         Qfu/e1RUsggMQZ/ZP1n5dwRJYarkm15IdAs2utHnahfiK5AOOvh57dOAFYUkIA9MFLy6
         fGJw==
X-Forwarded-Encrypted: i=1; AJvYcCXT8ndjlBTua6W5YdJqKlwEHIB+rxbvbt8sTPvYVBZuwLRxLslgO8NeDWZbu/naBd1I2M9P3B1De8RK1ejCXC0gTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxjFZMIDSdb3BgLPIqHNdYHSYHyp/umdM2rSjA1b6aDdDl51TR
	6wLjGh0oGVPdBhZA3+ds2TOSnpjCBsTEy9fa/UddCEjZEseaOUvfkEutzdM2JuT0Fvk=
X-Gm-Gg: ATEYQzzKGeCwIZcvHT8IVMOk5l03W5oeZxOwxL5Pzc/B0oL7zkrQ2zcCl9DP6KxN2ny
	KN9S+hkEA5Yyyd8/Tytp36yM4Hm/t90Q177yCxoBWdJLx+6oWE7cu2ZdvDDyilqEWbVQMlrtBsj
	9WUABl7dggT9x+shPYM8kSGA3QWXufuJxuqY4gMfeb/4srNNo5Ip+abPaEjfDy9rsRps5YluQ72
	aQ6Mz+uYrg5YYH/hmYM3feNorb4e/laYUgSgciJjXo/O5q1XIEHdr7VIfVvcA1k2MKNiHZjHLWh
	AvgqE+KG8o4kfZZ3pZ7/g0wcwZmRo/DFxbO2F4vA4UrbKsyLX6e/dVizq+cFbeSP7j9KSmvjw7o
	+w2YFgugbJCnPVQ2+7AWS1nouUcz0C1SgEBO44KtJ3y4r73Y3WiNY2/4WrBtZK8tIlq88pyxDGm
	ZbL4QwI2P6wVktraR90cjb2yfa+hOerbdpt4ZXB48IaEPGp/15CXwn5ieA7NEA6PJcURhOTJ0=
X-Received: by 2002:a05:6122:218e:b0:56c:8e80:7191 with SMTP id 71dfb90a1353d-56d21f2956cmr2436399e0c.3.1774456558669;
        Wed, 25 Mar 2026 09:35:58 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d38abfsm434683e0c.11.2026.03.25.09.35.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:35:57 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-951a0e3cdabso11952241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:35:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJunFhvQaZ3HmE6f774JtrvDPutDTNSKbLW4FhthC4qSY7uBXeYGG/9E1bmrI5mly5yULmlJNq7MdrqWsD4Md7LA==@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:5ff:ea89:44b5 with SMTP id
 ada2fe7eead31-6038753a92emr2391289137.32.1774456557341; Wed, 25 Mar 2026
 09:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772468323.git.geert+renesas@glider.be> <10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be>
 <20260313215912.GA3415767-robh@kernel.org>
In-Reply-To: <20260313215912.GA3415767-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:35:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
X-Gm-Features: AQROBzAa9n7pyJe-8mgf6m8MWZ5EBfxKw9iKFNekZ5OaRcP6UMYY0cGuEWeDl6U
Message-ID: <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] soc: renesas: Convert to of_machine_get_match()
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30264-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: ACC3D329638
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rob,

On Fri, 13 Mar 2026 at 22:59, Rob Herring <robh@kernel.org> wrote:
> On Mon, Mar 02, 2026 at 05:29:11PM +0100, Geert Uytterhoeven wrote:
> > Use the of_machine_get_match() helper to avoid accessing of_root
> > directly, which is planned to become private.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is an alternative solution to "[PATCH v2 8/9] soc: renesas: don't
> > access of_root directly"
> > https://lore.kernel.org/20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com
>
> Greg applied this, so you'll have to respin on top of that. Next cycle I
> guess. Unless you get him to revert it.

That was my impression, too, but apparently he skipped that patch.
So you can still apply this patch, too.

> I'm applying the rest of the series.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

