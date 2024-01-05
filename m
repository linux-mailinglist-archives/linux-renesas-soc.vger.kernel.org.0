Return-Path: <linux-renesas-soc+bounces-1328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C490D8251DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 11:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB9301C22DB3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C112C852;
	Fri,  5 Jan 2024 10:25:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B502C857
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f588ce1b6dso2965887b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 02:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704450349; x=1705055149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr6Cnonppc3S63EdOWbNPx3ZvYGnpDOLV4ON9zv6lps=;
        b=hybfDAAj0QnJN9MG1AmhQXSkzZQUUHMCIOKkpht+l4Nk/24naTiSxRy0mozIMhlQO4
         AUGkq1OMivvazQwUOi//WGlptOjpNDE+efTLu0sQhgrjbJFNMEIcopzn3kiOkIgVa3ij
         nG1VmVD23rrUahajBuoZqZUWqtjsKSKUqbTVAP8KupAwFxBLarnzL1kUQF38/JE51TfV
         28Znu9eAKCXXkhCve1yZ6SUZ4Z4A8KrLcUJMv4ncICCW/hWef/3BEuDgVd3t3Iir4kqe
         f1uSQPzPXqxtNmVVC1dhKMqB31mSFVphw18tsUFuYZn2xf0nSZ/Rvi0Z0o45y/I7C5lp
         oPvw==
X-Gm-Message-State: AOJu0YwL8fcsMNDm6pWBUXtpTSB6yffttflTC1pW5hdJ55uC50pSaX1U
	wnEETkLy5TeqOljw++ZTc+p222rOEGBS6g==
X-Google-Smtp-Source: AGHT+IFNB0Ha9qoNeA+5HlMO4pMY5KT/CBlNgleiUmVas85HkDN7+KAexnRkYcmUgWLuMPWNYFB6Dg==
X-Received: by 2002:a0d:fd82:0:b0:5e9:a678:deac with SMTP id n124-20020a0dfd82000000b005e9a678deacmr1342676ywf.30.1704450348947;
        Fri, 05 Jan 2024 02:25:48 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id w128-20020a0ded86000000b005e506ee2860sm546088ywe.38.2024.01.05.02.25.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 02:25:48 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e784ce9bb8so3289507b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 02:25:48 -0800 (PST)
X-Received: by 2002:a81:5dc5:0:b0:5e0:66ef:bca5 with SMTP id
 r188-20020a815dc5000000b005e066efbca5mr1188952ywb.40.1704450348254; Fri, 05
 Jan 2024 02:25:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105093703.3359949-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240105093703.3359949-1-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jan 2024 11:25:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXd39y6dOsBTJcBYfbTmqTGXnvQaiGOF_M0RBqfTA0UnA@mail.gmail.com>
Message-ID: <CAMuHMdXd39y6dOsBTJcBYfbTmqTGXnvQaiGOF_M0RBqfTA0UnA@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Fix returning wrong error code
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: vkoul@kernel.org, kishon@kernel.org, error27@gmail.com, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 10:42=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Even if device_create_file() returns error code,
> rcar_gen3_phy_usb2_probe() will return zero because the "ret" is
> variable shadowing.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202312161021.gOLDl48K-lkp@intel.com/
> Fixes: 441a681b8843 ("phy: rcar-gen3-usb2: fix implementation for runtime=
 PM")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

