Return-Path: <linux-renesas-soc+bounces-20454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CDB24876
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 13:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E6711A26B2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 11:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4692D373A;
	Wed, 13 Aug 2025 11:29:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBCF212547
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084548; cv=none; b=XKF1nGpvkP9xZoW5bvk6CZBeOATSzxnV4gvmp2RVuO5yiGfRcGyIoiCZzm2OekecanmovFz0EKt9Zu87oN3BUL75MdxNlNr7uBwNXtD1TLOTzUdn5CFffATnQb71jex1AAWJAhYlHEY1NE2eCf5elemFsDsxzYBcSxtxNxj2X7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084548; c=relaxed/simple;
	bh=V1w7ekoCOkixTcJu2Ia5N9x5WQzA0mzA+DmWQnepBn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=bim/jbNXkrfW7w8ieMH/k5Oi2dpIhpW4yK+ojBym6GH0TFvAyGPsaoeOz+nLZWgkG8tKborNrDXef1xFVIv6V9IMDkce6jQKAea7RwVUZkr6x56WfcfWDAsrLZ6NpfFPpSGtwqFbOJgXcVbPJ9sLZB6wVR0bJr1ljWAXZLJ9OR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-53b09bdcb73so654267e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 04:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755084545; x=1755689345;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wo/EeE50ympHeEsXZlgxqzmWw4w7icPjlViGd7siC4E=;
        b=W6qHDqWi5B1Y4/hWL4GCVcbmw999hNRALmgoBBDEfP+HUcPtbZIOGQ08SHdSSDRtKy
         WRQRykJYOHuOOYawTM4ldqBce9ki+ajsaYAgGfcp8Jv9u6ef9b1MjzfRCKXj16bZMOJf
         Giggng4xz3KJvbyqDTHfmOkRLTojpnU2epj9UGmwQoKPjvlRMnIKNrh3A7sgMZlpJnQI
         yz7lRQcqQ0nQm8w4/hfpZbNnJkz+5NLwcuJK6MAIlEEhDjQt3iI3MuS5ibKPlUpgeAl8
         h69rnRAx/Y9JafyfqiuxIP5Pwc62PDahOHFr6CPexpbsviuMiMiQ4KYX1MTEqD0tTr9n
         l9Ig==
X-Gm-Message-State: AOJu0Yzf59v9vAR0OXeuOyOx+nfj+VJinlVLAHMKLc6ojai02g7wMpAv
	aWxjygfF15HFh+c4o5x13aksm1RTs6223jfJmFB+K0GyaqXyR0huml4jT3X9Eb3Z
X-Gm-Gg: ASbGncvKrGLXJ3wEDng2K5M1VWHBLdL4PXmxLuG6w+z5P5zyPPgEPOyO4GSKsZALur+
	+dC5RFvSzQj+8u/B5/hd5peVklQP2lnHM+weGKnuJWyD/yPa65c6wcghUAaZRPX5by3RyoAUXm1
	HElzVshV43bgXrbJ364oN567XwJ8UoSwmTaLL4Zt3x2E/opwQntb3ZVStZSZZ1sxeoyi+Dn4tr+
	V+225u7Fjr5ga0rG01zHu+6lKr0UlXqEKZVjgkT9xMy7BY7B+fypSxc2W/+DunyB9lQy/nq4N1S
	Ppr8EQRwJL9NuEJOapsjx0grt7NO/uRluBqkgNV3TBHuBifwdcUKxc0R5NCTnVcxEKfba0T2W0d
	eEZBYT8m/HgTdiIfjjcah8l6i4DqZv0tEuiCjr2+M9i6kCFo3BG5pmAdHUgnwlBCE0BrmKOU=
X-Google-Smtp-Source: AGHT+IELVn0uJjma/8+98PLLRzSfbFdUTt+19Oe6S+7zvWTcz/5qLHKVYxnDKQPvC9i6NbLoi0+e4Q==
X-Received: by 2002:a05:6122:16a7:b0:539:237c:f95d with SMTP id 71dfb90a1353d-53b0c8b6f7amr712576e0c.0.1755084545064;
        Wed, 13 Aug 2025 04:29:05 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b028c565sm3889712e0c.16.2025.08.13.04.29.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 04:29:04 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-88ba493e984so464189241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 04:29:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3245:20b0:504:d7fc:d970 with SMTP id
 ada2fe7eead31-50e79d59d41mr391788137.12.1755084544527; Wed, 13 Aug 2025
 04:29:04 -0700 (PDT)
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
 <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com> <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
In-Reply-To: <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Aug 2025 13:28:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com>
X-Gm-Features: Ac12FXwOZokyioOmxH1n9GVH17wbfPOSY85T6Fom7H3YEnXaHqRt-bgDHlCzmVk
Message-ID: <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 13:25, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2025-07-29-v6.16 (TBD),
>   - renesas-drivers-2025-08-05-v6.16 (TBD).

That became renesas-drivers-2025-07-29-v6.16. followed by
renesas-drivers-2025-08-12-v6.17-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2025-08-26-v6.17-rc3,
  - renesas-drivers-2025-09-09-v6.17-rc5,
  - renesas-drivers-2025-09-23-v6.17-rc7,
  - renesas-drivers-2025-09-30-v6.17 (TBD),
  - renesas-drivers-2025-10-07-v6.17 (TBD).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

