Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60921197658
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2020 10:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbgC3IUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Mar 2020 04:20:42 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35529 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbgC3IUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Mar 2020 04:20:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id k21so17105926ljh.2;
        Mon, 30 Mar 2020 01:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=FLZ+NG1wdQZ/qjkMH527FZGQHZbq+EwwCn4uJZaDInk=;
        b=uwCapJDAj0Bl5VjtKDau23EU7c0ZBDf2eSSOYAS5ZKxQtpRd7DKd1mXjwZZapM2huO
         GpUI1mjRh8rCz81GaKPP+0465Xu0AR1PzYQmDJZ5kU3tVx4p4mkUiHEbQ2tmE3ng4nFG
         pgreSFpwXiIp454dg6vdWMV4PTYgOLWszBTss41mDF6iysabrBgjgMaNP53fHlB6lQyd
         woyzkGD20dqAdKCn0bjtPy/kgieoWtv08M7eNHt7GgUmpw/0f8bGnmlg5cQ1uYknFJQ+
         pGaPQV/Uq270iYoCNTCWSwvk8lHmgS5gkKzwf2hKmsKvKQJ2eW4XcCTN7tmDLqnPShul
         mwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=FLZ+NG1wdQZ/qjkMH527FZGQHZbq+EwwCn4uJZaDInk=;
        b=g7BlYcq+9P+hR+DBR7St4w2U+6ox9mwqm+d7ZRdamCwNV4TC7R5QpJQT5Enq5z3Heu
         q0tIwudL+nGzuiP5/nD2ldyVzRwrK4hhHQR6bzzkogI/Od7jmb9V6knq4v+mFYrUpaAB
         YM/AaqMOG2Yb6WXGjFfD1Z1iCSEvL5EWrfhex0Pp7RjGlkUVv36YUFcTRHrX6/6+0Xyr
         kXvO/rhAqUVhiyWSjyYIxnMPgiZ3oO3VMKbFdD16mh0tw4f3rycRzvEwjSw378mGVMth
         ixYy0hnLs+zNQa521/r8S68BatpDbqooZS7eoGmpH2UMfrgvLRfj8hFsfcr50/lB6v6R
         3z5Q==
X-Gm-Message-State: AGi0Pua+Q+IfbYo1Ch1n4mkCnNU2WF7eTRKbpVbxT0KYuKHUkadcvrmO
        g8ovQEpK5LpVQZVbbS9SnTc=
X-Google-Smtp-Source: APiQypIvqSkCWRFpeGx0VgbWzSLtaopBfQIx6KI7sHtr+D7EVvS4k7wIxqBMRiJWc5X5GelkRzK5nA==
X-Received: by 2002:a2e:988c:: with SMTP id b12mr6494651ljj.138.1585556439073;
        Mon, 30 Mar 2020 01:20:39 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id i2sm7577233ljj.72.2020.03.30.01.20.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 01:20:38 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 0/3] dt-bindings: usb: add r8a77961 support
In-Reply-To: <1585200410-28841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1585200410-28841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date:   Mon, 30 Mar 2020 11:20:33 +0300
Message-ID: <87eeta2qzy.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:

> This patch adds USB 2.0/3.0 devices support for r8a77961
> (R-Car M3-W+).
>
> Changes from v1:
>  - Update the comment of "renesas,xhci-r8a77961" for r8a77960.
>  - Add Reviewed-by.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D26=
1191
>
> Yoshihiro Shimoda (3):
>   dt-bindings: usb: usb-xhci: add r8a77961 support
>   dt-bindings: usb: renesas,usbhs: add r8a77961 support
>   dt-bindings: usb: renesas,usb3-peri: add r8a77961 support

All in testing/fixes now. Thank you

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6Bq9EACgkQzL64meEa
mQagKw//XQ8qAVrkhsFlPKd3BaxDvIFS5iZCearaNXGq9luOBXZxZEJM0sPwyw82
SET6P3fZCoYfR1e+TD/DUi3ixAKPP54iF8N28oXvFZwW7Fe7Y5ifxhEjPCEn/0CX
BSU6/xqP9y02+65wY28morys5/hMrxMVjKBP0PUA6FAx7nWEIMWDQn5SzwgpOnAK
t8z7GwfZfNGR9vpLtj22X09WaEaGlWv1cGTmw5nAdj8JQQO7mYTjet5Ih4HPz9Co
afrhe8XHlkzrAmidJIQZASdZpYk0pXsmxN4d6WU64GXAN9P7RKOdBdYPEjsBWCsB
tBWrz9fsCliR4edOpTO8uqmE88jIhgu+us8PuPnzullJWARtMN1QyKbf6Vr5HSS+
iPQGFH3Vw76ZhNq+CAwKiqwrFKgNdV3BhBpG880ht14QXv4XRIbR5OsCkDrGnZQC
b6CdrG+ayeT43Tij+e73NLysGZaIgKK9zC0wjeYk8lNlhoWJ0y9h/CJiuz5isL8o
Su16YqKO/wXnSqIXYu24jVccXh4zmG2IXfwoGocijM3ptgzmjxz36Le6kU+Cnqc1
xkYw5vzoZTi0o1sW4QnyGZyfjdkz3NwXtMBKsJC/SUeKnNL84UZ9IyppYAhRp6MX
PsAQ1FR3t2LGS5L/Vh3yaOAcrrFxzVfzoRF0IvDAaAGVqO7XuZ8=
=8Qwp
-----END PGP SIGNATURE-----
--=-=-=--
