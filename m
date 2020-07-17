Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA92223AA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 13:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgGQLic (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 07:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQLib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:38:31 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45988C061755
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 04:38:31 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s9so12181228ljm.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFJatZiPd3q4Ge25iIBb4A6tpk6jKl9wVvHTvMggx0A=;
        b=VzvFF3daDT32SYArgEhQB8Gjc0wPG2zfX08NRmzcXVON+AAHHUZeORxrzsh2fVDOzY
         fwG5bZnYMDrXNh/LKe5BCQ0qKZNSFhlaEQZCocn0g/Li1r2GMEsNoCejCuOeqwyQoXjy
         Wuj9l2fNzTUuSQbryr+nzy5Wpq2ZQgFep6+ea+k9qb59XKGCeMJ48K+Nt70lgqiZCagR
         aG6MgOvdUool0/M5qm2Jlbt4SiECa6wLjKesF9W+3uYbN94gYqk10UPyxuW/BtPraztg
         cPXewAtvL44IUZunAMZaLT/BIT/IlJNXjpQIfXt5jtnjrcT00Wa0VMqVe+Ot0XQcXkm9
         mcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFJatZiPd3q4Ge25iIBb4A6tpk6jKl9wVvHTvMggx0A=;
        b=TUVmv286IQE/vAO/EW2wRVZ3W5MK0egUU0FnzrP2jWcQeoaZA52NuCrIcCAK6Bk0nv
         iY/x2W7GdvBtr0Y2iFPdfUkJhF0cD0vjG3SVgWh5emhrZ0gK3wkte6CiMDigDMI4xxk2
         0hgIDkG6HeWjxaqBMnRkYjPR7dBg3aacTOzq1ijck5A6d6n8lIHppAXutQ8elha9gBWs
         sm0TqqGzKM6uC+9SJ+J7gDoxwys7o7e1eoxDiNVTkLIZyTfVPJgCXWmtXS3HP1lroHNH
         s6umng/DtKquTO0/JYVv067iXJ1IGRmXyeO0a3ilIRJFwdZXov4e506HUsqn39yjnowz
         6tCg==
X-Gm-Message-State: AOAM531BvnD9w2FKJ/PPLUbSMdVCXEHOAYUv9/VtgscUVrACJ7y75kU/
        B771vJ6/ZdRk85a7uCPCY7U1Lp04gtJDFTHF0DFNZQ==
X-Google-Smtp-Source: ABdhPJxGGqTq2L3ZGRxA/ALVYKMO3cg85lXJmKN6Tj2s0ZQ6g83NJgrXBF5hKYSVUntqiyaBKDe+U0cXUxnm/PxBw6A=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr4596515ljg.100.1594985909292;
 Fri, 17 Jul 2020 04:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200717100944.15966-1-geert+renesas@glider.be>
In-Reply-To: <20200717100944.15966-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 13:38:18 +0200
Message-ID: <CACRpkdZeFA2DkE5WxOD_2Sq4p0Xnww7wPUhfqGR8rK21RS_R8A@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.9 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 17, 2020 at 12:58 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit b2fc9b4eb1d79c03fd78e50b810c2ea27178e1e3:
>
>   pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions (2020-06-22 16:58:23 +0200)
>
> are available in the Git repository at:

Thanks, pulled in to my devel branch.

Yours,
Linus Walleij
