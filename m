Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0DA7B4CD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 09:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235708AbjJBHuf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 03:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235758AbjJBHud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 03:50:33 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C506CD3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 00:50:30 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a2478862dbso26827237b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Oct 2023 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696233030; x=1696837830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X37H5OoCG29VUOKJ+hYlXDwpqdLVJ1D+wE1MHUaOHHk=;
        b=E0tqZtH/uQGAFsYCTu0cNjJPRgEDrCskdz3KwukaZxCgapa/WOwHvPEmOdbmuFlNNi
         b9e0Vefs3YsCRShC1wXatmhlTiv8kyQhKONNTMhKlKS9/ne5KTqREj7sd2Xv0rLvmQeI
         wuNbjtw8lUZA42z+s1lOY8Q3PjMPW1Ws6Tr98qDVmSCtkL7q5vD5qfegqD8XhmynUa5n
         71idL9rY4OVh4owzmBtz3hYoqgSD+yVwfrqC+idt6arBEOGXuAvbAZSW+pX04BcpDNrE
         HbZTfbPljN7hcZtnOgoJ0m95/B31CuJKvwOtqRTS5RO9YprovY3lj8HfzDBbWab7xX/U
         CcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696233030; x=1696837830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X37H5OoCG29VUOKJ+hYlXDwpqdLVJ1D+wE1MHUaOHHk=;
        b=qNEKtwnMmJOMQJMPRb84wJnn+Dq0ek0lfJ76kvEn5U7gRlMVIr1qdPdi6gBtboMJUq
         0fodIfSZddITJvfDvXlWbKCd7Kx3NqVFFYzdLjd68yWI+opXY/73X8eoEKZW13NQB7hf
         v29AwseqUxcJnnMmVPZBbVW4J3LmC1nKaEJPn+doig9plYem4pPFMqa5bIJwuPDiHO35
         +VCs4ZuOM0E1Pu4QRXw5vFohoGLCBq5TE2xEYs901R+mzCmUjQIqrdv6tKXGxm3UxkHS
         KgBAkT8FiN2savT96w8SiZ7GwTEG5+Bq2SOAbiGlL7yWIVAvhNB0Qj/vCT0DTUxwJzu1
         voZA==
X-Gm-Message-State: AOJu0YzeyJ/b/ueDYTdNGnhfFNVDHY8GRSxt/rNKPldVQuW/ZeLKgFcH
        ZOdpejOK1KUy2xGPATFGxdcqEC4dBwPVOwI+4L/bKQ==
X-Google-Smtp-Source: AGHT+IF+6ZTZ1Izmtrao9zrQg53q9ExpBqK8h6wM5hQrAkazT6pBv1Pr8SVtItolD9Z+i/b0h1Atm+2m2dYtWSavx74=
X-Received: by 2002:a81:5b82:0:b0:58c:b5d2:bbd8 with SMTP id
 p124-20020a815b82000000b0058cb5d2bbd8mr11584242ywb.28.1696233030011; Mon, 02
 Oct 2023 00:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695986064.git.geert+renesas@glider.be>
In-Reply-To: <cover.1695986064.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Oct 2023 09:50:18 +0200
Message-ID: <CACRpkdYiqeKCrsehL3uOLrnwg0E4eJ705C8nmnJbL9JAxDMc+A@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.7
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 29, 2023 at 1:18=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d=
1d:
>
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.7-tag1
>
> for you to fetch changes up to c385256611b1af79d180e35c07992b43e1be5067:
>

Pulled into my "devel" branch, thanks!

Yours,
Linus Walleij
