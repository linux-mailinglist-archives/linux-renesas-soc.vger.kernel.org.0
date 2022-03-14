Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F18E4D8636
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Mar 2022 14:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiCNNut (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Mar 2022 09:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiCNNut (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 09:50:49 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB4BD46646;
        Mon, 14 Mar 2022 06:49:38 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF3551FB;
        Mon, 14 Mar 2022 06:49:38 -0700 (PDT)
Received: from e120937-lin (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 934A23F7D7;
        Mon, 14 Mar 2022 06:49:37 -0700 (PDT)
Date:   Mon, 14 Mar 2022 13:49:27 +0000
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dung Nguyen <dung.nguyen.zy@renesas.com>,
        Ofir Drang <Ofir.Drang@arm.com>
Subject: Re: [RFC/PATCH] crypto: ccree - fix a race of enqueue_seq() in
 send_request_init()
Message-ID: <Yi9Hyx8215bHVQfk@e120937-lin>
References: <20220311081909.1661934-1-yoshihiro.shimoda.uh@renesas.com>
 <CAOtvUMc67nT_hVJ8C5pnAQfSGSGtae79OJtadgD8wZC3dcNRLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOtvUMc67nT_hVJ8C5pnAQfSGSGtae79OJtadgD8wZC3dcNRLA@mail.gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 13, 2022 at 04:52:20PM +0200, Gilad Ben-Yossef wrote:
> Hi,
> 

Hi Gilad,

> On Fri, Mar 11, 2022 at 10:19 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> >
> > From: Dung Nguyen <dung.nguyen.zy@renesas.com>
> >
> > When loading ccree.ko, after registering cipher algorithm at
> > cc_cipher_alloc() and cc_hash_alloc() -> send_request_init() ->
> > enqueue_seq() has called to pushing descriptor into HW.
> >
> > On other hand, if another thread have called to encrypt/decrypt
> > cipher (cc_cipher_encrypt/decrypt) -> cc_send_request() ->
> > cc_do_send_request() -> enqueue_seq() while send_request_init()
> > is running, the thread also has called to pushing descriptor into HW.
> > And then, it's possible to overwrite data.
> >
> > The cc_do_send_request() locks mgr->hw_lock, but send_request_init()
> > doesn't lock mgr->hw_lock before enqueue_seq() is called. So,
> > send_request_init() should lock mgr->hw_lock before enqueue_seq() is
> > called.
> >
> > This issue is possible to cause the following way in rare cases:
> > - CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n
> > - insmod ccree.ko & insmod tcrypt.ko
> 
> Thank you very much Dung and Yoshihiro!
> 
> This is a very good catch and an issue we have missed indeed.
> 
> >
> > Signed-off-by: Dung Nguyen <dung.nguyen.zy@renesas.com>
> > [shimoda: revise the subject/description]
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  I believe we should fix this race. But, as I wrote the desciption
> >  above, there is in rare cases. So, I marked this patch as RFC.
> >
> >  drivers/crypto/ccree/cc_request_mgr.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/crypto/ccree/cc_request_mgr.c b/drivers/crypto/ccree/cc_request_mgr.c
> > index 887162df50f9..eef40022258b 100644
> > --- a/drivers/crypto/ccree/cc_request_mgr.c
> > +++ b/drivers/crypto/ccree/cc_request_mgr.c
> > @@ -513,6 +513,7 @@ int send_request_init(struct cc_drvdata *drvdata, struct cc_hw_desc *desc,
> >
> >         set_queue_last_ind(drvdata, &desc[(len - 1)]);
> >
> > +       spin_lock_bh(&req_mgr_h->hw_lock);
> >         /*
> >          * We are about to push command to the HW via the command registers
> >          * that may reference host memory. We need to issue a memory barrier
> > @@ -520,6 +521,7 @@ int send_request_init(struct cc_drvdata *drvdata, struct cc_hw_desc *desc,
> >          */
> >         wmb();
> >         enqueue_seq(drvdata, desc, len);
> > +       spin_unlock_bh(&req_mgr_h->hw_lock);
> >
> >         /* Update the free slots in HW queue */
> >         req_mgr_h->q_free_slots =
> > --
> > 2.25.1
> >
> 
> Having said that, adding a lock here is not the best solution. To be
> effective, the lock should be taken before the call to
> cc_queues_status() and released only after the updating of the free
> slots.
> However, while doing so will ensure there is no race condition with
> regard to writing to the hardware control registers, it does not deal
> at all with the case the hardware command FIFO is full due to
> encryption/decryption requests.
> This is by design, as the whole purpose of a seperate init time only
> send_request variant is to avoid these complexities, under the
> assumption that all access to the hardware is serialised at init time.
> 
> Therefore, a better solution is to switch the order of algo
> allocations so that the hash is allocated first, prior to any other
> alg that might be using the hardware FIFO and thus guaranteeing
> synchronized access and available FIFO space.
> 
> Can you please verify that the following patch indeed resolves the
> issue for you?
> 
> diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
> index 790fa9058a36..7d1bee86d581 100644
> --- a/drivers/crypto/ccree/cc_driver.c
> +++ b/drivers/crypto/ccree/cc_driver.c
> @@ -529,24 +529,26 @@ static int init_cc_resources(struct
> platform_device *plat_dev)
>                 goto post_req_mgr_err;
>         }
> 
> -       /* Allocate crypto algs */
> -       rc = cc_cipher_alloc(new_drvdata);
> +       /* hash must be allocated first due to use of send_request_init()
> +        * and dependency of AEAD on it
> +        */
> +       rc = cc_hash_alloc(new_drvdata);
>         if (rc) {
> -               dev_err(dev, "cc_cipher_alloc failed\n");
> +               dev_err(dev, "cc_hash_alloc failed\n");
>                 goto post_buf_mgr_err;
>         }
> 
> -       /* hash must be allocated before aead since hash exports APIs */
> -       rc = cc_hash_alloc(new_drvdata);
> +       /* Allocate crypto algs */
> +       rc = cc_cipher_alloc(new_drvdata);
>         if (rc) {
> -               dev_err(dev, "cc_hash_alloc failed\n");
> -               goto post_cipher_err;
> +               dev_err(dev, "cc_cipher_alloc failed\n");
> +               goto post_hash_err;
>         }
> 
>         rc = cc_aead_alloc(new_drvdata);
>         if (rc) {
>                 dev_err(dev, "cc_aead_alloc failed\n");
> -               goto post_hash_err;
> +               goto post_cipher_err;
>         }
> 
>         /* If we got here and FIPS mode is enabled
> @@ -558,10 +560,10 @@ static int init_cc_resources(struct
> platform_device *plat_dev)
>         pm_runtime_put(dev);
>         return 0;
> 
> -post_hash_err:
> -       cc_hash_free(new_drvdata);
>  post_cipher_err:
>         cc_cipher_free(new_drvdata);
> +post_hash_err:
> +       cc_hash_free(new_drvdata);
>  post_buf_mgr_err:
>          cc_buffer_mgr_fini(new_drvdata);
>  post_req_mgr_err:
> @@ -593,8 +595,8 @@ static void cleanup_cc_resources(struct
> platform_device *plat_dev)
>                 (struct cc_drvdata *)platform_get_drvdata(plat_dev);
> 
> 

I gave it a go to the above patch on my JUNO CCREE on top of a v5.17-rc8
(plus your ebad9d8fbadd crypto: ccree - don't attempt 0 len DMA
mappings) and it seems to solve have some sort of good effect :D but not
sure really what was the reproducer...

...I explain...without your fix that reorders hash and cipher allocs, in a
few occasions when I issue a

modprobe ccree & modprobe tcrypt

my system hung with no output at all....

Is this the (rare) apparent behaviour of the reported race ?

I would more likely expect that some tests failed due to the data
overwrite/corruption from the race....

Indeed, running a few loop of load/unload as above I observed also these
errors (wrong results) before the WARN splat:

[  207.923373] ccree 60010000.crypto: ARM CryptoCell 713 Driver: HW version 0x040BB0D0/0xB105F00D, Driver version 5.0
[  207.934975] alg: No test for essiv(cbc(paes),sha256) (essiv-paes-ccree)
[  208.186828] "modprobe" (1704) uses obsolete ecb(arc4) skcipher
[  208.648749] alg: No test for authenc(xcbc(aes),cbc(aes)) (authenc-xcbc-aes-cbc-aes-ccree)
[  208.658296] alg: No test for authenc(xcbc(aes),rfc3686(ctr(aes))) (authenc-xcbc-aes-rfc3686-ctr-aes-ccree) 
[  208.743217] alg: aead: rfc4106(gcm-aes-ccree) encryption test failed (wrong result) on test vector 0, cfg="two even aligned splits"
[  208.755148] ------------[ cut here ]------------
[  208.759824] alg: self-tests for rfc4106(gcm-aes-ccree) (rfc4106(gcm(aes))) failed (rc=-22)
[  208.759868] WARNING: CPU: 3 PID: 1851 at crypto/testmgr.c:5673 alg_test.part.45+0x110/0x3a8
[  208.776524] Modules linked in: ccree(+) tcrypt(+) authenc sm3_generic


...AND

[  220.380080] ccree 60010000.crypto: ARM CryptoCell 713 Driver: HWversion 0x040BB0D0/0xB105F00D, Driver version 5.0
[  220.391697] alg: No test for essiv(cbc(paes),sha256) (essiv-paes-ccree)
[  220.480167] alg: skcipher: cbc-aes-ccree decryption test failed (wrong result) on test vector 4, cfg="unaligned buffer, offset=1"
[  220.491911] ------------[ cut here ]------------
[  220.496596] alg: self-tests for cbc(aes) (cbc(aes)) failed (rc=-22)
[  220.496627] WARNING: CPU: 1 PID: 2681 at crypto/testmgr.c:5673 alg_test.part.45+0x110/0x3a8


... MOREOVER on one occasion after having made a mess as above with a load/unload loop
I hit also a splat at reboot (after a timeout/hang while trying to reboot):

[  742.442235] ------------[ cut here ]------------
[  742.442625] systemd-shutdown[1]: Sending SIGKILL to PID 3118 (modprobe).
[  742.446868] WARNING: CPU: 5 PID: 3117 at crypto/api.c:174 crypto_wait_for_test+0x70/0x78
[  742.446903] Modules linked in: ccree(+) tcrypt(+) authenc sm3_generic ofb md5 cmac vmac sm4_generic libsm4 ccm gcm streebog_generic sha3_generic ghash_generic seed blake2b_generic blake2s_generic rmd160 xxhash_generic lzo camellia_generic fcrypt pcbc anubis wp512 khazad tea michael_mic arc4 libarc4 cast6_generic cast5_generic cast_common cfb serpent_generic xts lrw twofish_generic twofish_common cbc blowfish_generic blowfish_common ecb md4 des_generic ctr libdes ip_tables x_tables ipv6 [last unloaded: authenc]
[  742.507343] CPU: 5 PID: 3117 Comm: modprobe Not tainted 5.17.0-rc8-00005-g61eb74b1c2a5 #9
[  742.515551] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, BIOS EDK II Jan 23 2017
[  742.526361] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  742.533352] pc : crypto_wait_for_test+0x70/0x78
[  742.537902] lr : crypto_wait_for_test+0x34/0x78
[  742.542452] sp : ffff800008903820
[  742.545775] x29: ffff800008903820 x28: ffff333542690880 x27: 0000000000000000
[  742.552952] x26: 0000000000000001 x25: 000048ca62342cfc x24: ffff3335414b2f88
[  742.560127] x23: ffff3335403a7010 x22: 0000000000000001 x21: ffffb736076f7230
[  742.567303] x20: 0000000000000000 x19: ffff3335418e3c00 x18: 0000000000000000
[  742.574477] x17: 000000040044ffff x16: 00400032b5503510 x15: 0000000000000000
[  742.581652] x14: ffff3335400e6200 x13: ffff7c00b7eff000 x12: 0000000034d4d91d
[  742.588827] x11: 0000000000000000 x10: 00000000000009a0 x9 : ffff800008903680
[  742.596003] x8 : ffff3335421fd000 x7 : ffff333540aa5680 x6 : 0000000947dfecad
[  742.603178] x5 : 00000000410fd030 x4 : 0000000000000000 x3 : ffff3335418e3d98
[  742.610353] x2 : ece3a452fbc36d00 x1 : 0000000000000000 x0 : 00000000fffffe00
[  742.617528] Call trace:
[  742.619979]  crypto_wait_for_test+0x70/0x78
[  742.624184]  crypto_register_alg+0xb8/0xe8
[  742.628301]  crypto_register_ahash+0x4c/0x60
[  742.632595]  cc_hash_alloc+0x17c/0x288 [ccree]
[  742.637136]  ccree_probe+0x810/0x8f0 [ccree]
[  742.641490]  platform_probe+0x68/0xd8
[  742.645176]  really_probe+0x184/0x400
[  742.648858]  __driver_probe_device+0x114/0x188
[  742.653324]  driver_probe_device+0x7c/0x108
[  742.657528]  __driver_attach+0xbc/0x1a0
[  742.661384]  bus_for_each_dev+0x74/0xc8
[  742.665238]  driver_attach+0x24/0x30
[  742.668832]  bus_add_driver+0x19c/0x238
[  742.672686]  driver_register+0x64/0x120
[  742.676542]  __platform_driver_register+0x28/0x38
[  742.681271]  ccree_init+0x28/0x34 [ccree]
[  742.685365]  do_one_initcall+0x74/0x1d0
[  742.689221]  do_init_module+0x44/0x200
[  742.692992]  load_module+0x2008/0x2688
[  742.696761]  __do_sys_finit_module+0xc4/0x138
[  742.701142]  __arm64_sys_finit_module+0x20/0x30
[  742.705695]  invoke_syscall+0x44/0x108
[  742.709467]  el0_svc_common.constprop.3+0x94/0xf8
[  742.714195]  do_el0_svc+0x24/0x88
[  742.717529]  el0_svc+0x20/0x50
[  742.720603]  el0t_64_sync_handler+0x90/0xb8
[  742.724808]  el0t_64_sync+0x180/0x184
[  742.728487] ---[ end trace 0000000000000000 ]---


On the BRIGHT side instead, with your fix instead I've never seen the system hang
or any of the above errors in several attempts and the output is as usual when loading
ccree before tcrypt:

root@tx2-juno-ccree:~# modprobe ccree & modprobe tcrypt
[1] 194
[   88.225366] ccree 60010000.crypto: ARM CryptoCell 713 Driver: HW version 0x040BB0D0/0xB105F00D, Driver version 5.0
[   88.861999] alg: No test for essiv(cbc(paes),sha256) (essiv-paes-ccree)
[   88.949896] alg: No test for authenc(xcbc(aes),cbc(aes)) (authenc-xcbc-aes-cbc-aes-ccree)
[   88.959134] alg: No test for authenc(xcbc(aes),rfc3686(ctr(aes))) (authenc-xcbc-aes-rfc3686-ctr-aes-ccree)
[   89.168893] ccree 60010000.crypto: ARM ccree device initialized
[   90.268538] "cryptomgr_test" (474) uses obsolete ecb(arc4) skcipher
[   90.288225] "modprobe" (195) uses obsolete ecb(arc4) skcipher
[   93.545850] tcrypt: all tests passed

Does it make sense ? 
Hope that helps a bit, let me know I have to do more (or different)
testing....(still lots of ignorance on my side about all of this :D...)

Thanks,
Cristian
