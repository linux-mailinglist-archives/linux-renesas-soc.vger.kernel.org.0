Return-Path: <linux-renesas-soc+bounces-28433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN/lACPAnWnzRgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 16:13:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D01188DB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 16:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34991301CFC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 15:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306513A1A59;
	Tue, 24 Feb 2026 15:13:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BD366839
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946016; cv=none; b=WYRapnTDLy1mAtia76Q6zOkVn3RRF2yhG2fE5ZJs304zJxKxEwSV4X2BS8M8z2iC8lGfCDjKt4j1G1kfJZpZudSwf6uNX12cAipqEsHe3PPr7EYTgsJ76TAIvWD9fv9yxIro7hKgJXDSLkZpft8kzn5mG5i+x8LZ1jtbeaoaof4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946016; c=relaxed/simple;
	bh=wXnM9qGPkSC53YwgZD+lN+beCJC2RwYF76Ht61sRC6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=uYU5aLVQnKNnYiuyv4DmtUGeHNmDxehuy9Sn6HTY4ylQ3cmYi37ww+FD9BuJGcv29vQTiEIfNADJY7+5uhF4XREIgQR+12G82PuUyEdnb7QT1ITOI93CO18LtFXIs3M4SiG1YpA49AD9IughJXSPzPNSyTJeU5EOPwrGM+CgU9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5662c2937fdso4973117e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 07:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771946013; x=1772550813;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbO52JV6SwH0Ec/SWI4HimlxpnF6xJadqOKzMbac1+4=;
        b=p/JO7iDMmCCwNgDoHj9AsplgqRCPe1ZMEIvN1akKYT9t11XUnbj1FUxtSg9JRjl1qb
         J5h1zXR7hSFYqxXZP6/5vkLJuIf+SkL/bGXeycxmIeOqFrIsaFalAsApDUO2h5UqVIWk
         N2vfI3MFMtYVjocsb1ANol+KMyi5SE32oCLJyfn1fgIBidyGHPB6sRzwTc89K1aLvori
         Xi8PNxtwz4+f8wLIipAqRW/vo6Re0PeFrvn9feXgFhCqiZHLk/4q6MUTUVlgKCgxX4aj
         VxkuSnGrETyRAT1CqeqnMmRrmmRbbDvrK40n+EZGNZFPD3dX4yyPih84gB94sxY9lEpq
         BI2w==
X-Gm-Message-State: AOJu0YxvlzFtKFW4Dqptt/KyZHteVbrRLcPdR/masi66Yu+ViEPDqRDu
	08/vfLx4HXklmSroRaRt106jtYX+46dqH1qMvypPH4pexEMojTLMcjtlrmNKM9Ds
X-Gm-Gg: ATEYQzx6XDwrDbiPHS7p1D4qYpcccUsJsHYCa0ZUIb0GYWuIcjMq6HSWLNM4HI7dKVd
	sMh+XFc6wCIccDaij+ouZGhUNq98gJJ47YcPklnFcTwaIYhGpfmrgJQ10G3zKW3gXgrBB02oNbZ
	DLtXBGQiJN+tu6h8042ubLYTHClCRiynkw6f8qqueM2580qPJr/svowrH4WAx3qf4a/Yk7L29cP
	TLNTvs2FJMwnIG2aef6/DWSx1eChJj50kWIWdSgWFejZxEhBKVU4Xd48yt2Jt05OytmhptdmYoX
	W1bdm9zn7hyElWRsQrCKr3cNQ7U+NMo+/u6kB3i5pK9zWkYHIsyRq84+mO5rAGWx34GIPCQBikR
	DGTqcyfq9XKwtRgrn1xWnTJ5Bh320rm8zdTZPnfgTHEQTU/8cZ2AouQ0CezjoSNDmfUGnM5bU5p
	OEt2hSOGjpb9gmO9umKwP7sYl6lO0QDQD2T3e1qDJi04PfdqsJSftzaVIOpxmGSyb2GPzRWhA=
X-Received: by 2002:a05:6122:8298:b0:563:62ce:b28a with SMTP id 71dfb90a1353d-56a7d4d4e1amr207261e0c.5.1771946012920;
        Tue, 24 Feb 2026 07:13:32 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e579c2ccsm12840029e0c.2.2026.02.24.07.13.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 07:13:32 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5f5418c40daso6010381137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 07:13:32 -0800 (PST)
X-Received: by 2002:a05:6102:4415:b0:5fe:f592:1626 with SMTP id
 ada2fe7eead31-5feffd8eda9mr238035137.3.1771946011904; Tue, 24 Feb 2026
 07:13:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
 <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
 <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
 <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
 <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
 <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
 <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
 <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
 <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
 <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
 <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com>
 <CAMuHMdUQv9i1ZUhzZV+YhhmjbO-f-0n9ocfBYAiVYP6We5Evpw@mail.gmail.com> <CAMuHMdUrk5GzMWqbYa7PnrQf157TCnS1xjyiV267EakcL+bCLQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUrk5GzMWqbYa7PnrQf157TCnS1xjyiV267EakcL+bCLQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Feb 2026 16:13:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM_Q-Tk++nt2ZhwpzZmo=M3fv0fzPr59jAv6q=ec=vtQ@mail.gmail.com>
X-Gm-Features: AaiRm53scKi5YKZ9cyz6pTVK-ceVey101DKo4nF48ta3OJp78PnXB9RFaDHES3I
Message-ID: <CAMuHMdWM_Q-Tk++nt2ZhwpzZmo=M3fv0fzPr59jAv6q=ec=vtQ@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28433-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 40D01188DB4
X-Rspamd-Action: no action

On Tue, 16 Dec 2025 at 19:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2026-02-03-v6.19 (TBD),
>   - renesas-drivers-2026-02-10-v6.19 (TBD).

That became renesas-drivers-2026-02-10-v6.19, followed by
renesas-drivers-2026-02-24-v7.0-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2026-03-10-v7.0-rc3,
  - renesas-drivers-2026-02-24-v7.0-rc5,
  - renesas-drivers-2026-04-07-v7.0-rc7,
  - renesas-drivers-2026-04-14-v7.0 (TBD),
  - renesas-drivers-2026-04-21-v7.0 (TBD).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

