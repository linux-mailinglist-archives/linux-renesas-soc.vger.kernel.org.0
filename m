Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEDF84D75F3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Mar 2022 15:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbiCMOxj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Mar 2022 10:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbiCMOxi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Mar 2022 10:53:38 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DAD89CD0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Mar 2022 07:52:30 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id v130so26096407ybe.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Mar 2022 07:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lduXrnkF4K9zyGc1RLVWB0WnN6+qmXS3MBXJcwH+LO8=;
        b=bguZj7vUz40UXa0VAZtwXmAgNs/TSPKxJaRnkeGbtGYcLRqnXeQJ5mNefRhkRRE8EZ
         voGsDX/OzrIZ7coKhsfStmL8eFYgiUhOQvzdwKZj/M2EZ10jLKJEhOVcFB+/yX9JtVXN
         xq84GEERo82iFqA/wUYqaG9vNxP3F6IUl7AjsL6kvcj3M18xHQU1BaKVvtOnZEWCEb58
         XEnLR6HRn+BivsJ83SwaK3t46dZvVUXZSxTJ6TqMnJYxhuvRFRqjwL2Rg8k7HY5Ocqxd
         iElgfQnXXCd0FwVkP62MkVWqJ9rRt4xdBHa2fCWLzRcYYtoTJ3VDiYGI/a1510KB5qTH
         WT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lduXrnkF4K9zyGc1RLVWB0WnN6+qmXS3MBXJcwH+LO8=;
        b=OZinehlaRhSuMVuWz+4v+EfUOZazSnW1iFBbh8dCcM5VMdXVxIADYlS1rrW7RztHR3
         Mc0n6Pr/82Hx80wjZcKZHgj8fpEjWURM1k+KG11vFDfEpL7m4tMK8EZylOphot+muS3H
         B5tw95PSWg5S2hpU5jAPKFxfolh92u9gshPL/9rZ9ChI2O5LbNJcqZQYyS8yvTTGThVt
         EryHTFiNsJCpe2xs8EInz0EdGgDgPW3BMK7/LqPh1ZedMvARhVkW3o+vQnngq902ptRh
         eo9KtPAJwquSA/6EwkeF0U7AJa9ZUSXy238NzQkkuZjf9jU6vAD8YAAzFmKnbW8Jji0G
         B54g==
X-Gm-Message-State: AOAM530CQcsR6ZdPDkoHtZHvZn8s7DMQzscl5lA5TyBY+71xE1RozRAH
        /QybZt9LTzht2reOd6+pPZJVOybAWwrPAAA0VyZE/w==
X-Google-Smtp-Source: ABdhPJxDrm3r88J9xcwXrTqXOIueR+AolY3TjsyymxjQiW+qJgp1E/hSM4poIiMA07epL9yv7UOSR9iNUaTBHbnXm5M=
X-Received: by 2002:a25:7804:0:b0:628:ec4c:989b with SMTP id
 t4-20020a257804000000b00628ec4c989bmr13960359ybc.428.1647183149860; Sun, 13
 Mar 2022 07:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220311081909.1661934-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220311081909.1661934-1-yoshihiro.shimoda.uh@renesas.com>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Sun, 13 Mar 2022 16:52:20 +0200
Message-ID: <CAOtvUMc67nT_hVJ8C5pnAQfSGSGtae79OJtadgD8wZC3dcNRLA@mail.gmail.com>
Subject: Re: [RFC/PATCH] crypto: ccree - fix a race of enqueue_seq() in send_request_init()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dung Nguyen <dung.nguyen.zy@renesas.com>,
        cristian.marussi@arm.com, Ofir Drang <Ofir.Drang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Fri, Mar 11, 2022 at 10:19 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> From: Dung Nguyen <dung.nguyen.zy@renesas.com>
>
> When loading ccree.ko, after registering cipher algorithm at
> cc_cipher_alloc() and cc_hash_alloc() -> send_request_init() ->
> enqueue_seq() has called to pushing descriptor into HW.
>
> On other hand, if another thread have called to encrypt/decrypt
> cipher (cc_cipher_encrypt/decrypt) -> cc_send_request() ->
> cc_do_send_request() -> enqueue_seq() while send_request_init()
> is running, the thread also has called to pushing descriptor into HW.
> And then, it's possible to overwrite data.
>
> The cc_do_send_request() locks mgr->hw_lock, but send_request_init()
> doesn't lock mgr->hw_lock before enqueue_seq() is called. So,
> send_request_init() should lock mgr->hw_lock before enqueue_seq() is
> called.
>
> This issue is possible to cause the following way in rare cases:
> - CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dn
> - insmod ccree.ko & insmod tcrypt.ko

Thank you very much Dung and Yoshihiro!

This is a very good catch and an issue we have missed indeed.

>
> Signed-off-by: Dung Nguyen <dung.nguyen.zy@renesas.com>
> [shimoda: revise the subject/description]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  I believe we should fix this race. But, as I wrote the desciption
>  above, there is in rare cases. So, I marked this patch as RFC.
>
>  drivers/crypto/ccree/cc_request_mgr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/crypto/ccree/cc_request_mgr.c b/drivers/crypto/ccree=
/cc_request_mgr.c
> index 887162df50f9..eef40022258b 100644
> --- a/drivers/crypto/ccree/cc_request_mgr.c
> +++ b/drivers/crypto/ccree/cc_request_mgr.c
> @@ -513,6 +513,7 @@ int send_request_init(struct cc_drvdata *drvdata, str=
uct cc_hw_desc *desc,
>
>         set_queue_last_ind(drvdata, &desc[(len - 1)]);
>
> +       spin_lock_bh(&req_mgr_h->hw_lock);
>         /*
>          * We are about to push command to the HW via the command registe=
rs
>          * that may reference host memory. We need to issue a memory barr=
ier
> @@ -520,6 +521,7 @@ int send_request_init(struct cc_drvdata *drvdata, str=
uct cc_hw_desc *desc,
>          */
>         wmb();
>         enqueue_seq(drvdata, desc, len);
> +       spin_unlock_bh(&req_mgr_h->hw_lock);
>
>         /* Update the free slots in HW queue */
>         req_mgr_h->q_free_slots =3D
> --
> 2.25.1
>

Having said that, adding a lock here is not the best solution. To be
effective, the lock should be taken before the call to
cc_queues_status() and released only after the updating of the free
slots.
However, while doing so will ensure there is no race condition with
regard to writing to the hardware control registers, it does not deal
at all with the case the hardware command FIFO is full due to
encryption/decryption requests.
This is by design, as the whole purpose of a seperate init time only
send_request variant is to avoid these complexities, under the
assumption that all access to the hardware is serialised at init time.

Therefore, a better solution is to switch the order of algo
allocations so that the hash is allocated first, prior to any other
alg that might be using the hardware FIFO and thus guaranteeing
synchronized access and available FIFO space.

Can you please verify that the following patch indeed resolves the
issue for you?

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_dri=
ver.c
index 790fa9058a36..7d1bee86d581 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -529,24 +529,26 @@ static int init_cc_resources(struct
platform_device *plat_dev)
                goto post_req_mgr_err;
        }

-       /* Allocate crypto algs */
-       rc =3D cc_cipher_alloc(new_drvdata);
+       /* hash must be allocated first due to use of send_request_init()
+        * and dependency of AEAD on it
+        */
+       rc =3D cc_hash_alloc(new_drvdata);
        if (rc) {
-               dev_err(dev, "cc_cipher_alloc failed\n");
+               dev_err(dev, "cc_hash_alloc failed\n");
                goto post_buf_mgr_err;
        }

-       /* hash must be allocated before aead since hash exports APIs */
-       rc =3D cc_hash_alloc(new_drvdata);
+       /* Allocate crypto algs */
+       rc =3D cc_cipher_alloc(new_drvdata);
        if (rc) {
-               dev_err(dev, "cc_hash_alloc failed\n");
-               goto post_cipher_err;
+               dev_err(dev, "cc_cipher_alloc failed\n");
+               goto post_hash_err;
        }

        rc =3D cc_aead_alloc(new_drvdata);
        if (rc) {
                dev_err(dev, "cc_aead_alloc failed\n");
-               goto post_hash_err;
+               goto post_cipher_err;
        }

        /* If we got here and FIPS mode is enabled
@@ -558,10 +560,10 @@ static int init_cc_resources(struct
platform_device *plat_dev)
        pm_runtime_put(dev);
        return 0;

-post_hash_err:
-       cc_hash_free(new_drvdata);
 post_cipher_err:
        cc_cipher_free(new_drvdata);
+post_hash_err:
+       cc_hash_free(new_drvdata);
 post_buf_mgr_err:
         cc_buffer_mgr_fini(new_drvdata);
 post_req_mgr_err:
@@ -593,8 +595,8 @@ static void cleanup_cc_resources(struct
platform_device *plat_dev)
                (struct cc_drvdata *)platform_get_drvdata(plat_dev);


Thanks again!
Gilad

--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
