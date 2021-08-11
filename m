Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784553E9643
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 18:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbhHKQot (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 12:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhHKQob (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 12:44:31 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217AAC061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 09:44:05 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso2439469wms.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=5NTJSky9UX3JbuB9riY3wCYfXDpCwy2c7hzO0kF4AHA=;
        b=MeMkfHJavPMqXcD6LZtaPi7QfY/k2WzXVIu1zNnfaSk/3RJKK3X95243euhVh8AiZD
         D3hyUgCn2G8nk0Fumhx4fkOV0ac/+nCTXKtVfoJcVGaTpAmEaTNg9qD+7V12etsPK9p3
         Uy1eOPSZtUJRiG4WzD+OXnMfqk/0Gr5wc8w24kUNgyGl34zuWvxnMKW6ZTlkOMYimYsr
         64RAxM4sLUNWJaHXGYfhrd8/ddwpnfqj4LK/Yp3l4L6egMnKMaxEu3V/Fp5OQaE6zNbn
         MsRojf2BEshtYT+e+6SHP1vCdq7g1Z7A4eHZYw3tJ1hc1N8GQXv1P2/PSkIREJ9YhqPi
         YSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=5NTJSky9UX3JbuB9riY3wCYfXDpCwy2c7hzO0kF4AHA=;
        b=fuVPXoPGtssvvxbZ3y++mGC/YRqkvXGPnPYrb9qibtC3cJgmSEFx8X/Lz3YKNsi8xS
         8YQ6OL6AmKnPRnHlyNwmzBaEhKwQGArTrlqT0iOHVAXLy+OUZnKMuPX/GAwlUXwYY/WH
         1BCitjXx8m8LClpTYBW1S55zMiXQzMiKiqG4PoTryouhZcx5sJ2fwTtxyEQiVbBpPpEP
         m4I5pZMFSz/65qtMh6XTTBljE5v7DPfKeccKPv0tvEZHy7UfSEAAS+CqHoVHdMdSVdbY
         aRZxrqKQGB6m2boO7CLqhauRnL4tmAi3OlYbyCKmV+J8qUOqLuAkQB6JYy4nvh2pvWx2
         fw2g==
X-Gm-Message-State: AOAM531GcBHQiKoGaPQwDx2A3PQ6BAWE4qqbGAvpBnhctHTZRmNiB8TS
        mVrBI5cROHnOADRI6Gxfr4Y=
X-Google-Smtp-Source: ABdhPJx899uT0DFaxtP457b5Z3Dy4rSN7l44lDxiYJ3ljPtwHDqHtITCNx0vUwfvw7F2OUIbyXDjTg==
X-Received: by 2002:a7b:cf13:: with SMTP id l19mr11315336wmg.134.1628700243788;
        Wed, 11 Aug 2021 09:44:03 -0700 (PDT)
Received: from [192.168.1.70] ([102.64.209.185])
        by smtp.gmail.com with ESMTPSA id s1sm2699637wmh.46.2021.08.11.09.43.44
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Aug 2021 09:44:03 -0700 (PDT)
Message-ID: <6113fe53.1c69fb81.ff4c7.b7fe@mx.google.com>
From:   Vanina curth <curtisvani0040@gmail.com>
X-Google-Original-From: Vanina  curth
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Dear
To:     Recipients <Vanina@vger.kernel.org>
Date:   Wed, 11 Aug 2021 16:43:08 +0000
Reply-To: curtisvani9008@gmail.com
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

How are you? I'm Vanina. I'm interested to know you and I would like to kno=
w more about you and establish relationship with you. i will wait for your =
response. thank you.
